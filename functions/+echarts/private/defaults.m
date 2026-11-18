%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% option = defaults(type)
%   Sensible baseline ECharts option for a given primary series type. Cartesian
%   types (bar, line, scatter, bubble, boxplot, candlestick, heatmap) get a grid
%   with category/value axes; radial and relational types do not. The result is
%   a plain struct meant to be deep-merged with user options.
function option = defaults(type)
  option = struct();
  option.tooltip = struct('show', true);
  option.legend = struct('show', true, 'top', 8);
  switch lower(char(type))
    case {'bar', 'line', 'pictorialbar'}
      option.tooltip.trigger = 'axis';
      option.grid = gridBox();
      option.xAxis = struct('type', 'category', 'boundaryGap', ...
        any(strcmp(lower(char(type)), {'bar', 'pictorialbar'})));
      option.yAxis = struct('type', 'value');
    case {'scatter', 'bubble', 'effectscatter'}
      option.tooltip.trigger = 'item';
      option.grid = gridBox();
      option.xAxis = struct('type', 'value', 'scale', true);
      option.yAxis = struct('type', 'value', 'scale', true);
    case {'boxplot', 'candlestick'}
      option.tooltip.trigger = 'axis';
      option.tooltip.confine = true;
      option.grid = gridBox();
      option.xAxis = struct('type', 'category', 'boundaryGap', true);
      option.yAxis = struct('type', 'value');
    case 'heatmap'
      option.tooltip.trigger = 'item';
      option.grid = gridBox();
      option.xAxis = struct('type', 'category', 'splitArea', struct('show', true));
      option.yAxis = struct('type', 'category', 'splitArea', struct('show', true));
    case {'pie', 'doughnut', 'funnel', 'radar', 'gauge', 'sunburst', 'tree', ...
          'treemap', 'sankey', 'graph', 'themeriver', 'map'}
      option.tooltip.trigger = 'item';
    otherwise
      % Unknown / plugin types keep the generic baseline.
  end
end
%=============================================================================
function g = gridBox()
  % A compact grid that reserves room for axis labels on every side.
  g = struct('left', '3%', 'right', '4%', 'bottom', '3%', 'top', 48, ...
    'containLabel', true);
end
%=============================================================================
