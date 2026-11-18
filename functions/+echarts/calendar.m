%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.calendar(dates, values)
% c = echarts.calendar(dates, values, 'Range', R, 'Title', '...')
%   Create a calendar heatmap: one colored cell per day. 'dates' are the days
%   (a datetime vector, or a cell array of 'yyyy-mm-dd' strings) and 'values'
%   the per-day magnitude. 'Range' sets the calendar span (a year '2024', a
%   month '2024-03', or a {from, to} pair); it defaults to the data span.
%
%   Example:
%     d = datetime(2024,1,1):datetime(2024,12,31);
%     echarts.calendar(d, rand(1, numel(d))).show();
function c = calendar(dates, values, varargin)
  range = [];
  titleText = '';
  for k = 1:2:numel(varargin)
    switch lower(char(varargin{k}))
      case 'range'
        range = varargin{k + 1};
      case 'title'
        titleText = char(varargin{k + 1});
      otherwise
        error('echarts:calendar', 'Unknown option "%s".', char(varargin{k}));
    end
  end
  days = asDateStrings(dates);
  values = double(values(:));
  n = numel(days);
  if numel(values) ~= n
    error('echarts:calendar', 'dates and values must be the same length.');
  end
  data = cell(n, 1);
  for k = 1:n
    data{k} = {days{k}, values(k)};
  end
  if isempty(range)
    range = days{1}(1:4);
  end
  c = echarts.chart('heatmap');
  c.option('legend.show', false);
  c.Option = rmfield(c.Option, 'xAxis');
  c.Option = rmfield(c.Option, 'yAxis');
  c.Option = rmfield(c.Option, 'grid');
  % Build the calendar struct incrementally: 'range' may be a {from, to} cell,
  % which struct(...) would otherwise expand into a struct array.
  cal = struct('top', 80, 'left', 40, 'right', 20);
  cal.cellSize = {'auto', 16};
  cal.range = range;
  c.option('calendar', cal);
  c.addSeries(data, 'coordinateSystem', 'calendar');
  c.visualMap(min(values), max(values), 'orient', 'horizontal', ...
    'left', 'center', 'top', 20);
  if ~isempty(titleText)
    c.title(titleText);
  end
end
%=============================================================================
function out = asDateStrings(dates)
  if isdatetime(dates)
    dates = dates(:);
    out = cell(numel(dates), 1);
    for k = 1:numel(dates)
      out{k} = char(datestr(dates(k), 'yyyy-mm-dd'));
    end
  else
    out = ascellstr(dates);
    out = out(:);
  end
end
%=============================================================================
