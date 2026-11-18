%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.fromOption(option)
%   Build a chart from a complete ECharts option struct. This is the escape
%   hatch for anything the typed helpers do not cover: any valid ECharts option
%   can be rendered. 'option.series' may be a struct array or a cell array of
%   series structs. For an empty chart to fill programmatically, use
%   echarts.chart(type) instead.
%
%   Example:
%     opt.xAxis.data = {'a','b','c'};
%     opt.yAxis = struct();
%     opt.series = { struct('type','line','data',[1 3 2]) };
%     c = echarts.fromOption(opt);
function c = fromOption(option)
  if ~isstruct(option)
    error('echarts:fromOption', 'An ECharts option must be a struct.');
  end
  type = 'bar';
  series = {};
  if isfield(option, 'series')
    series = toCellColumn(option.series);
    if ~isempty(series) && isstruct(series{1}) && isfield(series{1}, 'type')
      type = series{1}.type;
    end
  end
  c = echarts.chart(type);
  c.Option = option;
  c.Option.series = series;
end
%=============================================================================
function out = toCellColumn(value)
  if iscell(value)
    out = value(:).';
  elseif isstruct(value)
    out = cell(1, numel(value));
    for k = 1:numel(value)
      out{k} = value(k);
    end
  else
    out = {value};
  end
end
%=============================================================================
