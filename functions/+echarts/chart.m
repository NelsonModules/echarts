%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% echarts.chart  Interactive Apache ECharts chart.
%
%   A Chart holds a primary series type and a full ECharts option tree. It
%   serializes to the exact ECharts option object, so anything ECharts can
%   express is reachable. Use the factory helpers (echarts.bar, echarts.line,
%   ...) to build one, then the fluent methods below to refine it, and show /
%   save to display or export it.
%
%   Every setter returns the chart, so calls can be chained:
%     echarts.bar({'Jan','Feb','Mar'}, [10 7 13]).title('Sales').ylabel('units').show();
%   or written as separate statements, whichever reads better.
%
%   Chart methods:
%     addSeries   - append a series (numeric series or ready data)
%     labels      - set the category-axis labels
%     title/subtitle/legend/xlabel/ylabel/grid/colors - refine display
%     stack/smooth/area/horizontal/logscale/yaxis2 - series & axes
%     tooltip/toolbox/dataZoom/visualMap - interaction components
%     markLine/markArea/markPoint/hline/vline/xregion/yregion/labelAt - annotations
%     option      - get or set any ECharts option by dotted path
%     config/json - the assembled option (struct / JSON text)
%     html/save   - a self-contained HTML document (text / file)
%     saveImage/copyImage - save/copy the rendered chart as a PNG (live display)
%     show/update/close - display live and refresh it
%     append/push - add points live (sliding window via MaxPoints)
%     theme/animate - visual style
%     trendline/movingAverage - fitted overlays on the first series
%     onClick/onHover/onLegendClick - callbacks (live display)
%     print - open the print dialog (save as PDF, live display)
%
%   See also: echarts.bar, echarts.line, echarts.scatter, echarts.pie,
%     echarts.heatmap, echarts.boxplot, echarts.candlestick, echarts.radar.
classdef chart < handle
  properties
    % Primary ECharts series type: 'bar','line','scatter','pie','radar', ...
    Type = 'bar'
    % The full ECharts option tree (single source of truth).
    Option = struct()
    % Library source: 'auto' (bundled, offline), 'cdn', an URL, a .js path, or
    % a cell array also listing extensions ('gl','wordcloud','liquidfill').
    Library = 'auto'
    % Maximum number of points kept per series when appending (Inf = keep all).
    MaxPoints = Inf
    % Visual theme: 'light' (default) or 'dark'.
    Theme = 'light'
    % Optional JavaScript run once, right after the chart first renders, for
    % in-page animation or live updates. The snippet runs with the ECharts
    % instance as `chart` and the library as `echarts` in scope. Ignored by the
    % live WebView display (which has no page of its own).
    OnReady = ''
  end
  properties (Access = private)
    Figure = []
    Component = []
    TempFile = ''
    ClickFcn = []
    HoverFcn = []
    LegendFcn = []
    LastImage = ''
  end
  methods
    %=========================================================================
    function obj = chart(type)
      % c = echarts.chart(type)  Create an empty chart of the given type.
      if nargin >= 1 && ~isempty(type)
        obj.Type = char(type);
      end
      obj.Option = defaults(obj.Type);
      obj.Option.series = {};
    end
    %=========================================================================
    function obj = addSeries(obj, data, varargin)
      % c = addSeries(c, data, Name, Value, ...)  Append a series. 'data' is a
      % numeric series, or a cell / struct array already shaped as ECharts data
      % (for example {[x y], ...} points or {struct('name',..,'value',..)}).
      % Name/Value pairs set ECharts series fields verbatim, e.g.
      % 'name','Sales', 'smooth',true, 'type','line'.
      s = struct();
      s.type = obj.Type;
      if isnumeric(data) || islogical(data)
        s.data = double(data(:)).';
      else
        s.data = data;
      end
      if mod(numel(varargin), 2) ~= 0
        error('echarts:addSeries', 'Name/Value arguments must come in pairs.');
      end
      for k = 1:2:numel(varargin)
        s.(char(varargin{k})) = varargin{k + 1};
      end
      obj.Option.series{end + 1} = s;
    end
    %=========================================================================
    function obj = labels(obj, value)
      % c = labels(c, value)  Set the category-axis labels (cellstr or numeric).
      value = asLabelData(value);
      if isHorizontal(obj)
        obj.Option = setpath(obj.Option, 'yAxis.data', value);
      else
        obj.Option = setpath(obj.Option, 'xAxis.data', value);
      end
    end
    %=========================================================================
    function obj = title(obj, text)
      % c = title(c, text)  Set the chart title (centered, at the top).
      obj.Option = setpath(obj.Option, 'title.text', char(text));
      obj.Option = setpath(obj.Option, 'title.left', 'center');
      obj.Option = setpath(obj.Option, 'title.top', 10);
      obj.layoutForTitle();
    end
    %=========================================================================
    function obj = subtitle(obj, text)
      % c = subtitle(c, text)  Set the chart subtitle (under the title).
      obj.Option = setpath(obj.Option, 'title.subtext', char(text));
      obj.Option = setpath(obj.Option, 'title.left', 'center');
      obj.layoutForTitle();
    end
    %=========================================================================
    function obj = legend(obj, value)
      % c = legend(c, value)  Control the legend. 'value' is a logical (show or
      % hide), or a position: 'top','left','bottom','right', or 'off'/'none'.
      if islogical(value) || isnumeric(value)
        obj.Option = setpath(obj.Option, 'legend.show', logical(value));
        return
      end
      pos = lower(char(value));
      if any(strcmp(pos, {'off', 'none', 'hide'}))
        obj.Option = setpath(obj.Option, 'legend.show', false);
        return
      end
      obj.Option = setpath(obj.Option, 'legend.show', true);
      obj.Option = clearLegendAnchors(obj.Option);
      switch pos
        case 'bottom'
          obj.Option = setpath(obj.Option, 'legend.bottom', 8);
          obj.Option = setpath(obj.Option, 'legend.orient', 'horizontal');
        case 'left'
          obj.Option = setpath(obj.Option, 'legend.left', 8);
          obj.Option = setpath(obj.Option, 'legend.top', 'middle');
          obj.Option = setpath(obj.Option, 'legend.orient', 'vertical');
        case 'right'
          obj.Option = setpath(obj.Option, 'legend.right', 8);
          obj.Option = setpath(obj.Option, 'legend.top', 'middle');
          obj.Option = setpath(obj.Option, 'legend.orient', 'vertical');
        otherwise
          obj.Option = setpath(obj.Option, 'legend.top', 8);
          obj.Option = setpath(obj.Option, 'legend.orient', 'horizontal');
      end
    end
    %=========================================================================
    function obj = xlabel(obj, text)
      % c = xlabel(c, text)  Set the x-axis title (cartesian charts).
      obj.Option = setpath(obj.Option, 'xAxis.name', char(text));
      obj.Option = setpath(obj.Option, 'xAxis.nameLocation', 'middle');
      obj.Option = setpath(obj.Option, 'xAxis.nameGap', 30);
    end
    %=========================================================================
    function obj = ylabel(obj, text)
      % c = ylabel(c, text)  Set the y-axis title (cartesian charts).
      obj.Option = setpath(obj.Option, 'yAxis.name', char(text));
      obj.Option = setpath(obj.Option, 'yAxis.nameLocation', 'end');
    end
    %=========================================================================
    function obj = grid(obj, tf)
      % c = grid(c, tf)  Show or hide the axis split lines.
      tf = logical(tf);
      obj.Option = setpath(obj.Option, 'xAxis.splitLine.show', tf);
      obj.Option = setpath(obj.Option, 'yAxis.splitLine.show', tf);
    end
    %=========================================================================
    function obj = colors(obj, value)
      % c = colors(c, value)  Set the categorical palette. 'value' is a named
      % palette ('echarts','tableau','pastel','set2','dark2','bright','vintage',
      % 'roma'), a single color, or a cell array of colors; ECharts cycles it
      % across series (or slices, for pie / funnel).
      if (ischar(value) || isstring(value)) && ...
         any(strcmp(lower(char(value)), {'echarts', 'tableau', 'pastel', ...
           'set2', 'dark2', 'bright', 'vintage', 'roma'}))
        list = colorset(max(9, numel(obj.Option.series)), char(value));
      else
        list = value;
        if ~iscell(list)
          list = {list};
        end
      end
      obj.Option.color = list(:).';
    end
    %=========================================================================
    function obj = stack(obj, name)
      % c = stack(c)       stack every series into one group (bar / line).
      % c = stack(c, name) stack into the named group.
      if nargin < 2 || isempty(name)
        name = 'total';
      end
      for k = 1:numel(obj.Option.series)
        obj.Option.series{k}.stack = char(name);
      end
    end
    %=========================================================================
    function obj = smooth(obj, tf)
      % c = smooth(c)        draw line series with smoothed curves.
      % c = smooth(c, false) use straight segments again.
      if nargin < 2
        tf = true;
      end
      tf = logical(tf);
      for k = 1:numel(obj.Option.series)
        obj.Option.series{k}.smooth = tf;
      end
    end
    %=========================================================================
    function obj = area(obj, tf)
      % c = area(c)        fill the area under line series.
      % c = area(c, false) remove the fill.
      if nargin < 2
        tf = true;
      end
      for k = 1:numel(obj.Option.series)
        if logical(tf)
          obj.Option.series{k}.areaStyle = struct();
        elseif isfield(obj.Option.series{k}, 'areaStyle')
          obj.Option.series{k} = rmfield(obj.Option.series{k}, 'areaStyle');
        end
      end
    end
    %=========================================================================
    function obj = dataLabels(obj, value)
      % c = dataLabels(c)        show the value on each data item.
      % c = dataLabels(c, false) hide the labels again.
      % c = dataLabels(c, pos)   show them at position pos ('top','inside', ...).
      show = true;
      pos = '';
      if nargin >= 2
        if islogical(value)
          show = value;
        else
          pos = char(value);
        end
      end
      for k = 1:numel(obj.Option.series)
        obj.Option.series{k}.label.show = show;
        if ~isempty(pos)
          obj.Option.series{k}.label.position = pos;
        end
      end
    end
    %=========================================================================
    function obj = horizontal(obj)
      % c = horizontal(c)  Put the categories on the y-axis (horizontal bars).
      x = getpath(obj.Option, 'xAxis', struct());
      y = getpath(obj.Option, 'yAxis', struct());
      obj.Option.xAxis = y;
      obj.Option.yAxis = x;
    end
    %=========================================================================
    function obj = logscale(obj, axis)
      % c = logscale(c, axis)  Use a logarithmic scale on 'x' or 'y'.
      obj.Option = setpath(obj.Option, [char(axis), 'Axis.type'], 'log');
    end
    %=========================================================================
    function obj = yaxis2(obj, label)
      % c = yaxis2(c, label)  Add a second y-axis on the right and put the last
      % series on it (for two series with different ranges).
      y1 = getpath(obj.Option, 'yAxis', struct('type', 'value'));
      y2 = struct('type', 'value', 'name', char(label), 'position', 'right', ...
        'splitLine', struct('show', false));
      obj.Option.yAxis = {y1, y2};
      if ~isempty(obj.Option.series)
        obj.Option.series{end}.yAxisIndex = 1;
      end
    end
    %=========================================================================
    function obj = tooltip(obj, mode)
      % c = tooltip(c, mode)  Set the tooltip trigger ('axis' or 'item'), turn
      % it off (false), or merge a struct of tooltip options.
      if nargin < 2
        mode = 'axis';
      end
      if islogical(mode)
        obj.Option = setpath(obj.Option, 'tooltip.show', mode);
      elseif isstruct(mode)
        cur = getpath(obj.Option, 'tooltip', struct());
        obj.Option.tooltip = mergeopts(cur, mode);
      else
        obj.Option = setpath(obj.Option, 'tooltip.show', true);
        obj.Option = setpath(obj.Option, 'tooltip.trigger', char(mode));
      end
    end
    %=========================================================================
    function obj = toolbox(obj, varargin)
      % c = toolbox(c)  Add the ECharts toolbox: save-as-image, data zoom,
      % restore, a data view and a line/bar switch. Pass 'Features', C to list
      % only some of {'saveAsImage','dataZoom','restore','dataView','magicType'}.
      feats = {'saveAsImage', 'dataZoom', 'restore', 'dataView', 'magicType'};
      for k = 1:2:numel(varargin)
        if strcmpi(varargin{k}, 'features')
          feats = cellstr(varargin{k + 1});
        end
      end
      f = struct();
      for k = 1:numel(feats)
        switch lower(feats{k})
          case 'saveasimage'
            f.saveAsImage = struct('show', true);
          case 'datazoom'
            f.dataZoom = struct('show', true);
          case 'restore'
            f.restore = struct('show', true);
          case 'dataview'
            f.dataView = struct('show', true, 'readOnly', false);
          case 'magictype'
            f.magicType = struct('type', {{'line', 'bar'}});
        end
      end
      obj.Option = setpath(obj.Option, 'toolbox.feature', f);
      obj.Option = setpath(obj.Option, 'toolbox.right', 16);
    end
    %=========================================================================
    function obj = dataZoom(obj, mode)
      % c = dataZoom(c)        add wheel / drag zoom and a slider on the x-axis.
      % c = dataZoom(c, mode)  restrict to 'x', 'y' or 'xy'.
      if nargin < 2 || isempty(mode)
        mode = 'x';
      end
      mode = lower(char(mode));
      zooms = {};
      if any(strcmp(mode, {'x', 'xy'}))
        zooms{end + 1} = struct('type', 'inside', 'xAxisIndex', 0);
        zooms{end + 1} = struct('type', 'slider', 'xAxisIndex', 0, 'bottom', 8);
      end
      if any(strcmp(mode, {'y', 'xy'}))
        zooms{end + 1} = struct('type', 'inside', 'yAxisIndex', 0);
        zooms{end + 1} = struct('type', 'slider', 'yAxisIndex', 0, 'right', 8);
      end
      obj.Option.dataZoom = zooms;
    end
    %=========================================================================
    function obj = visualMap(obj, lo, hi, varargin)
      % c = visualMap(c, lo, hi, Name, Value, ...)  Add a continuous visual map
      % that colors data by value between lo and hi. Name/Value pairs merge
      % extra visualMap options (for example 'inRange', struct('color',{{...}})).
      vm = struct('min', lo, 'max', hi, 'calculable', true, ...
        'orient', 'horizontal', 'left', 'center', 'bottom', 8);
      for k = 1:2:numel(varargin)
        vm.(char(varargin{k})) = varargin{k + 1};
      end
      obj.Option.visualMap = vm;
    end
    %=========================================================================
    function obj = markLine(obj, spec, varargin)
      % c = markLine(c, spec, ...)  Add a mark line to the first series. 'spec'
      % is a struct (or cell of structs) describing ECharts markLine data items.
      obj.addMark('markLine', spec, varargin);
    end
    %=========================================================================
    function obj = markArea(obj, spec, varargin)
      % c = markArea(c, spec, ...)  Add a mark area to the first series.
      obj.addMark('markArea', spec, varargin);
    end
    %=========================================================================
    function obj = markPoint(obj, spec, varargin)
      % c = markPoint(c, spec, ...)  Add a mark point to the first series.
      obj.addMark('markPoint', spec, varargin);
    end
    %=========================================================================
    function obj = hline(obj, y, varargin)
      % c = hline(c, y, Name, Value, ...)  Draw a horizontal reference line.
      item = struct('yAxis', y);
      item = applyNV(item, varargin);
      obj.addMarkLineItem(item);
    end
    %=========================================================================
    function obj = vline(obj, x, varargin)
      % c = vline(c, x, Name, Value, ...)  Draw a vertical reference line.
      item = struct('xAxis', x);
      item = applyNV(item, varargin);
      obj.addMarkLineItem(item);
    end
    %=========================================================================
    function obj = xregion(obj, x1, x2, varargin)
      % c = xregion(c, x1, x2, ...)  Highlight a vertical band between x1 and x2.
      pair = {struct('xAxis', x1), struct('xAxis', x2)};
      obj.addMarkAreaItem(pair, varargin);
    end
    %=========================================================================
    function obj = yregion(obj, y1, y2, varargin)
      % c = yregion(c, y1, y2, ...)  Highlight a horizontal band between y1, y2.
      pair = {struct('yAxis', y1), struct('yAxis', y2)};
      obj.addMarkAreaItem(pair, varargin);
    end
    %=========================================================================
    function obj = labelAt(obj, x, y, text, varargin)
      % c = labelAt(c, x, y, text, ...)  Place a text label at (x, y).
      item = struct('coord', {{x, y}}, 'value', char(text), ...
        'label', struct('show', true, 'formatter', char(text)));
      item = applyNV(item, varargin);
      obj.addMark('markPoint', item, {});
    end
    %=========================================================================
    function varargout = option(obj, path, value)
      % v = option(c, path)            read an ECharts option by dotted path.
      % c = option(c, path, value)     set it (creating levels as needed).
      %   Example: option(c, 'yAxis.min', 0)
      if nargin >= 3
        obj.Option = setpath(obj.Option, path, value);
        if nargout > 0
          varargout{1} = obj;
        end
      else
        varargout{1} = getpath(obj.Option, path, []);
      end
    end
    %=========================================================================
    function cfg = config(obj)
      % cfg = config(c)  The assembled ECharts option struct.
      cfg = obj.Option;
    end
    %=========================================================================
    function txt = json(obj, varargin)
      % txt = json(c)                  compact ECharts JSON option.
      % txt = json(c, 'pretty', true)  indented JSON.
      pretty = false;
      for k = 1:2:numel(varargin)
        if strcmpi(varargin{k}, 'pretty')
          pretty = logical(varargin{k + 1});
        end
      end
      txt = jsonencode(obj.config());
      if pretty
        txt = jsonprettyprint(txt);
      end
    end
    %=========================================================================
    function txt = html(obj, varargin)
      % txt = html(c, Name, Value, ...)  A self-contained HTML document string.
      %   Options: 'PageTitle', 'Width', 'Height', 'Theme', 'Toolbar', 'Library'.
      opts = parseRenderOptions(obj, varargin{:});
      scriptTag = library(opts.Library);
      txt = htmldoc(jsonencode(obj.config()), scriptTag, opts);
    end
    %=========================================================================
    function filename = save(obj, filename, varargin)
      % f = save(c, filename, Name, Value, ...)  Write the HTML document to disk.
      writeTextFile(filename, obj.html(varargin{:}));
    end
    %=========================================================================
    function obj = show(obj, varargin)
      % c = show(c, Name, Value, ...)  Display the chart. In the WebView /
      % WebAssembly desktop it is embedded live in a UI figure and can be
      % refreshed with update; elsewhere a self-contained page is opened in the
      % HTML viewer (Qt) or the system browser.
      opts = parseRenderOptions(obj, varargin{:});
      switch target()
        case 'webview'
          obj.renderWebview(opts);
        case 'qt'
          obj.renderFile('qt', opts);
        otherwise
          obj.renderFile('cli', opts);
      end
    end
    %=========================================================================
    function obj = update(obj)
      % c = update(c)  Refresh the live display with the current option. Only
      % the embedded WebView display updates in place; elsewhere the data is
      % changed silently and the next show() renders it.
      if strcmp(target(), 'webview') && obj.isLive()
        set(obj.Component, 'Data', obj.config());
      end
    end
    %=========================================================================
    function obj = append(obj, label, values)
      % c = append(c, label, values)  Append a category and one value per series
      % (scalar, or a vector with one value per series), then refresh. Honors
      % MaxPoints as a sliding window.
      ax = axisDataPath(obj);
      cur = getpath(obj.Option, ax, {});
      if iscell(cur)
        cur{end + 1} = label;
      else
        cur = [cur, label];
      end
      obj.Option = setpath(obj.Option, ax, trimtail(cur, obj.MaxPoints));
      values = double(values(:)).';
      for k = 1:numel(obj.Option.series)
        v = values(min(k, numel(values)));
        d = obj.Option.series{k}.data;
        if iscell(d)
          d{end + 1} = v;
        else
          d = [d, v];
        end
        obj.Option.series{k}.data = trimtail(d, obj.MaxPoints);
      end
      obj.update();
    end
    %=========================================================================
    function obj = push(obj, value)
      % c = push(c, value)  Append one value to the first series and refresh
      % (honoring MaxPoints). Convenient for a single live series.
      if isempty(obj.Option.series)
        obj.addSeries(value);
      else
        d = obj.Option.series{1}.data;
        if iscell(d)
          d{end + 1} = value;
        else
          d = [d, value];
        end
        obj.Option.series{1}.data = trimtail(d, obj.MaxPoints);
      end
      obj.update();
    end
    %=========================================================================
    function obj = theme(obj, name)
      % c = theme(c, name)  Apply 'light' (default) or 'dark' styling. The dark
      % theme uses the built-in ECharts dark palette on the live and exported
      % pages.
      obj.Theme = lower(char(name));
    end
    %=========================================================================
    function obj = animate(obj, value)
      % c = animate(c, false)        disable animations.
      % c = animate(c, duration_ms)  set the animation duration.
      if islogical(value)
        obj.Option.animation = value;
      else
        obj.Option.animation = true;
        obj.Option.animationDuration = double(value);
      end
    end
    %=========================================================================
    function obj = movingAverage(obj, k, varargin)
      % c = movingAverage(c, k)  Add a moving-average line of the first series
      % over a window of k points.
      y = double(obj.Option.series{1}.data);
      ma = movmean(y, k);
      obj.addSeries(ma, 'name', sprintf('MA(%d)', k), 'type', 'line', ...
        'smooth', true, 'symbol', 'none', varargin{:});
    end
    %=========================================================================
    function obj = trendline(obj, kind, degree)
      % c = trendline(c)            add a linear trend line of the first series.
      % c = trendline(c, 'poly', n) add a degree-n polynomial trend.
      if nargin < 2 || isempty(kind)
        kind = 'linear';
      end
      if strcmpi(kind, 'linear')
        deg = 1;
      else
        deg = degree;
      end
      d = obj.Option.series{1}.data;
      if iscell(d)
        % Point data [[x, y], ...]: fit over the actual x values.
        xy = cell2mat(d(:));
        x = xy(:, 1).';
        y = xy(:, 2).';
        p = polyfit(x, y, deg);
        xs = sort(x);
        yfit = polyval(p, xs);
        obj.addSeries(points2d(xs, yfit), 'name', 'trend', 'type', 'line', ...
          'symbol', 'none', 'lineStyle', struct('type', 'dashed'));
      else
        y = double(d);
        x = 1:numel(y);
        p = polyfit(x, y, deg);
        yfit = polyval(p, x);
        obj.addSeries(yfit, 'name', 'trend', 'type', 'line', 'symbol', 'none', ...
          'lineStyle', struct('type', 'dashed'));
      end
    end
    %=========================================================================
    function obj = onClick(obj, fcn)
      % c = onClick(c, fcn)  Register a callback fired when a data item is
      % clicked. fcn receives a struct with fields seriesIndex, dataIndex (both
      % 1-based), name, seriesName, value and componentType. Interactive
      % callbacks need the live WebView / WebAssembly display; register before
      % show, or call show again.
      obj.ClickFcn = validateFcn(fcn);
      obj.wireEvents();
    end
    %=========================================================================
    function obj = onHover(obj, fcn)
      % c = onHover(c, fcn)  Register a callback fired when the hovered data item
      % changes (live display). Same payload as onClick.
      obj.HoverFcn = validateFcn(fcn);
      obj.wireEvents();
    end
    %=========================================================================
    function obj = onLegendClick(obj, fcn)
      % c = onLegendClick(c, fcn)  Callback when a legend entry is toggled (live
      % display). fcn receives a struct with field name.
      obj.LegendFcn = validateFcn(fcn);
      obj.wireEvents();
    end
    %=========================================================================
    function filename = saveImage(obj, filename, varargin)
      % f = saveImage(c, filename, Name, Value, ...)  Save the chart as a PNG.
      % This captures the rendered chart, so it needs the live WebView /
      % WebAssembly display: call show first. Options: 'Scale' (pixel ratio) and
      % 'Background' (a CSS color). Elsewhere, use save to export an HTML page.
      if ~strcmp(target(), 'webview') || ~obj.isLive()
        error('echarts:saveImage:webviewRequired', ['saveImage needs the live ', ...
          'WebView/WebAssembly display; call show() first. Use save() to export ', ...
          'an HTML page instead.']);
      end
      params = struct();
      for k = 1:2:numel(varargin)
        switch lower(char(varargin{k}))
          case 'scale'
            params.scale = double(varargin{k + 1});
          case 'background'
            params.background = char(varargin{k + 1});
        end
      end
      obj.LastImage = '';
      sendEventToHTMLSource(obj.Component, 'requestImage', params);
      started = tic();
      while isempty(obj.LastImage) && toc(started) < 10
        drawnow();
        sleep(0.05);
      end
      if isempty(obj.LastImage)
        error('echarts:saveImage', 'Timed out waiting for the chart image.');
      end
      uri = obj.LastImage;
      comma = strfind(uri, ',');
      if ~isempty(comma)
        uri = uri(comma(1) + 1:end);
      end
      bytes = base64decode(uri);
      fid = fopen(filename, 'wb');
      if fid == -1
        error('echarts:saveImage', 'Cannot open "%s" for writing.', char(filename));
      end
      cleaner = onCleanup(@() fclose(fid));
      fwrite(fid, bytes, 'uint8');
    end
    %=========================================================================
    function copyImage(obj)
      % copyImage(c)  Copy the chart image to the clipboard (live WebView only).
      if ~strcmp(target(), 'webview') || ~obj.isLive()
        error('echarts:copyImage:webviewRequired', ...
          'copyImage needs the live WebView/WebAssembly display; call show() first.');
      end
      sendEventToHTMLSource(obj.Component, 'copyImage', struct());
    end
    %=========================================================================
    function print(obj)
      % print(c)  Open the print dialog (save as PDF) for the live WebView page.
      if ~strcmp(target(), 'webview') || ~obj.isLive()
        error('echarts:print:webviewRequired', ...
          'print needs the live WebView/WebAssembly display; call show() first.');
      end
      sendEventToHTMLSource(obj.Component, 'print', struct());
    end
    %=========================================================================
    function close(obj)
      % close(c)  Close the display opened by show (WebView figure).
      if obj.isLive()
        close(obj.Figure);
      end
      obj.Figure = [];
      obj.Component = [];
    end
    %=========================================================================
    function disp(obj)
      fprintf('  echarts.chart  type=%s  series=%d\n', obj.Type, ...
        numel(obj.Option.series));
    end
    %=========================================================================
    function display(obj)
      name = inputname(1);
      if ~isempty(name)
        fprintf('\n%s =\n\n', name);
      end
      disp(obj);
      fprintf('\n');
    end
  end
  %===========================================================================
  methods (Access = private)
    function layoutForTitle(obj)
      % Push the legend and the grid down so a top title does not overlap them.
      if getpath(obj.Option, 'legend.show', true)
        if ~isfield(obj.Option.legend, 'bottom')
          obj.Option = setpath(obj.Option, 'legend.top', 40);
        end
      end
      if isfield(obj.Option, 'grid')
        obj.Option = setpath(obj.Option, 'grid.top', 72);
      end
    end
    %=========================================================================
    function obj = addMark(obj, kind, spec, extra)
      if isempty(obj.Option.series)
        error('echarts:mark', 'Add a series before an annotation.');
      end
      if iscell(spec)
        items = spec;
      else
        spec = applyNV(spec, extra);
        items = {spec};
      end
      cur = getpath(obj.Option.series{1}, [kind, '.data'], {});
      obj.Option.series{1}.(kind).data = [cur(:).', items(:).'];
    end
    %=========================================================================
    function addMarkLineItem(obj, item)
      if isempty(obj.Option.series)
        error('echarts:mark', 'Add a series before an annotation.');
      end
      cur = getpath(obj.Option.series{1}, 'markLine.data', {});
      obj.Option.series{1}.markLine.data = [cur(:).', {item}];
      obj.Option.series{1}.markLine.symbol = {'none', 'none'};
    end
    %=========================================================================
    function addMarkAreaItem(obj, pair, extra)
      if isempty(obj.Option.series)
        error('echarts:mark', 'Add a series before an annotation.');
      end
      pair{1} = applyNV(pair{1}, extra);
      cur = getpath(obj.Option.series{1}, 'markArea.data', {});
      obj.Option.series{1}.markArea.data = [cur(:).', {pair}];
    end
    %=========================================================================
    function tf = isLive(obj)
      tf = ~isempty(obj.Figure) && ~isempty(obj.Component);
      if tf
        try
          tf = ishandle(obj.Figure);
        catch
          tf = false;
        end
      end
    end
    %=========================================================================
    function wireEvents(obj)
      if obj.isLive()
        set(obj.Component, 'HTMLEventReceivedFcn', @(s, e) obj.handleEvent(s, e));
      end
    end
    %=========================================================================
    function [bg, themeArg] = themeBits(obj)
      if strcmp(obj.Theme, 'dark')
        bg = '#1e1e1e';
        themeArg = '"dark"';
      else
        bg = '#ffffff';
        themeArg = 'null';
      end
    end
    %=========================================================================
    function renderWebview(obj, opts)
      if ~obj.isLive()
        obj.Figure = uifigure('Name', opts.PageTitle);
        if opts.Width > 0 && opts.Height > 0
          p = get(obj.Figure, 'Position');
          set(obj.Figure, 'Position', [p(1), p(2), opts.Width, opts.Height]);
        end
        obj.Component = uihtml(obj.Figure);
        set(obj.Component, 'HTMLEventReceivedFcn', @(s, e) obj.handleEvent(s, e));
        [bg, themeArg] = obj.themeBits();
        set(obj.Component, 'HTMLSource', livepage(library(opts.Library), bg, themeArg));
        % Let the component track the figure so it grows with the window.
        try
          set(obj.Component, 'Units', 'normalized');
          set(obj.Component, 'Position', [0, 0, 1, 1]);
        catch
        end
        set(obj.Figure, 'SizeChangedFcn', @(s, e) obj.layoutComponent());
        obj.layoutComponent();
      end
      set(obj.Component, 'Data', obj.config());
    end
    %=========================================================================
    function handleEvent(obj, ~, event)
      % Route a page event to the matching Nelson handler.
      switch event.HTMLEventName
        case 'image'
          data = event.HTMLEventData;
          if isstruct(data) && isfield(data, 'data')
            obj.LastImage = data.data;
          end
        case 'pointClick'
          dispatchPoint(obj.ClickFcn, event.HTMLEventData);
        case 'pointHover'
          dispatchPoint(obj.HoverFcn, event.HTMLEventData);
        case 'legendClick'
          if ~isempty(obj.LegendFcn)
            f = obj.LegendFcn;
            f(event.HTMLEventData);
          end
      end
    end
    %=========================================================================
    function layoutComponent(obj)
      % Keep the component filling the figure as it is resized.
      try
        set(obj.Component, 'Units', 'normalized');
        set(obj.Component, 'Position', [0, 0, 1, 1]);
      catch
        p = get(obj.Figure, 'Position');
        set(obj.Component, 'Position', [0, 0, p(3), p(4)]);
      end
    end
    %=========================================================================
    function renderFile(obj, mode, opts)
      htmlText = obj.html('PageTitle', opts.PageTitle, 'Width', opts.Width, ...
        'Height', opts.Height, 'Theme', opts.Theme, 'Toolbar', opts.Toolbar, ...
        'Library', opts.Library);
      % Write the page to a file first: the Qt HTML viewer loads a file (its
      % backend is 'webview'), but a raw HTML string always falls back, which
      % would otherwise pop the chart open in the system browser instead.
      if isempty(obj.TempFile)
        obj.TempFile = [tempname(), '.html'];
      end
      writeTextFile(obj.TempFile, htmlText);
      if strcmp(mode, 'qt') && obj.openInViewer(obj.TempFile)
        return
      end
      openInSystemBrowser(obj.TempFile);
    end
    %=========================================================================
    function ok = openInViewer(obj, htmlFile)
      % Show the page file in the embedded HTML viewer. Any visible backend
      % counts; only the non-visible 'fallback' does not, so the system-browser
      % fallback never double-opens a window.
      ok = false;
      if exist('web') == 0
        return
      end
      try
        [~, viewer] = web(htmlFile, '-new');
        ok = ~isempty(viewer) && isobject(viewer);
        if ok
          try
            if strcmp(viewer.getBackend(), 'fallback')
              ok = false;
            end
          catch
            % A viewer object was returned; treat it as shown.
          end
        end
      catch
        ok = false;
      end
    end
  end
end
%=============================================================================
function path = axisDataPath(obj)
  if isHorizontal(obj)
    path = 'yAxis.data';
  else
    path = 'xAxis.data';
  end
end
%=============================================================================
function tf = isHorizontal(obj)
  % A horizontal bar chart carries the category axis on y.
  yt = getpath(obj.Option, 'yAxis.type', '');
  tf = strcmp(yt, 'category');
end
%=============================================================================
function value = asLabelData(value)
  % A string array becomes a cellstr; cell and numeric category data is kept as
  % is (ECharts category axes accept numbers directly).
  if isstring(value)
    value = cellstr(value);
    value = value(:).';
  end
end
%=============================================================================
function option = clearLegendAnchors(option)
  for name = {'top', 'bottom', 'left', 'right'}
    if isfield(option, 'legend') && isfield(option.legend, name{1})
      option.legend = rmfield(option.legend, name{1});
    end
  end
end
%=============================================================================
function s = applyNV(s, extra)
  for k = 1:2:numel(extra)
    s.(char(extra{k})) = extra{k + 1};
  end
end
%=============================================================================
function fcn = validateFcn(fcn)
  if ~isempty(fcn) && ~isa(fcn, 'function_handle')
    error('echarts:callback', 'The callback must be a function handle or [].');
  end
end
%=============================================================================
function dispatchPoint(fcn, info)
  if isempty(fcn)
    return
  end
  if isfield(info, 'seriesIndex') && info.seriesIndex >= 0
    info.seriesIndex = info.seriesIndex + 1;
  end
  if isfield(info, 'dataIndex') && info.dataIndex >= 0
    info.dataIndex = info.dataIndex + 1;
  end
  fcn(info);
end
%=============================================================================
