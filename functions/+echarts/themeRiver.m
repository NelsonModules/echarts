%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.themeRiver(times, values, names)
% c = echarts.themeRiver(..., 'Title', '...')
%   Create a theme-river (stream graph): stacked flowing bands over time. The
%   three inputs are aligned element-wise: 'times' are date labels or numbers,
%   'values' the band thickness, and 'names' the band each point belongs to.
%
%   Example:
%     t = {'2020','2020','2021','2021'}; v = [10 8 12 9]; n = {'A','B','A','B'};
%     echarts.themeRiver(t, v, n).show();
function c = themeRiver(times, values, names, varargin)
  o = factoryopts(varargin);
  t = ascellstr(times);
  values = double(values(:));
  nm = ascellstr(names);
  m = numel(t);
  if numel(values) ~= m || numel(nm) ~= m
    error('echarts:themeRiver', 'times, values and names must be the same length.');
  end
  data = cell(m, 1);
  for k = 1:m
    data{k} = {t{k}, values(k), nm{k}};
  end
  c = echarts.chart('themeRiver');
  c.option('tooltip.trigger', 'axis');
  c.option('singleAxis', struct('type', 'time', 'top', 50, 'bottom', 50));
  c.addSeries(data, 'emphasis', struct('focus', 'self'));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
