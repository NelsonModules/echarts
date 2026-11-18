%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.stem(y)
% c = echarts.stem(x, y)
% c = echarts.stem(..., 'Title', '...')
%   Create a stem plot: a marker at each (x, y) with a thin line dropping to the
%   baseline. x defaults to 1..n when omitted.
%
%   Example:
%     n = 0:30; echarts.stem(n, sin(n/3)).title('Impulse').show();
function c = stem(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  if numel(pos) == 1
    y = double(pos{1}(:));
    x = (1:numel(y)).';
  else
    x = double(pos{1}(:));
    y = double(pos{2}(:));
  end
  heads = points2d(x, y);
  c = echarts.chart('scatter');
  c.option('xAxis.type', 'value');
  c.option('legend.show', false);
  % A thin bar from the baseline gives the stem; the scatter gives the head.
  c.addSeries(points2d(x, y), 'type', 'bar', 'barWidth', 2, 'name', ...
    seriesname(o.Names, 1), 'itemStyle', struct('color', '#5470c6'));
  c.addSeries(heads, 'type', 'scatter', 'symbolSize', 10, ...
    'itemStyle', struct('color', '#5470c6'));
  c.option('legend.show', false);
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
