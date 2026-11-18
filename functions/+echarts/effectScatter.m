%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.effectScatter(x, y)
% c = echarts.effectScatter(..., 'Title', '...')
%   Create a scatter chart whose points pulse with a ripple effect, useful to
%   draw attention to a handful of highlighted points. x and y are vectors.
%
%   Example:
%     echarts.effectScatter([1 2 3], [4 7 2]).title('Hotspots').show();
function c = effectScatter(x, y, varargin)
  o = factoryopts(varargin);
  c = echarts.chart('effectScatter');
  c.option('xAxis.type', 'value');
  c.option('xAxis.scale', true);
  c.option('yAxis.type', 'value');
  c.option('yAxis.scale', true);
  c.addSeries(points2d(x, y), 'name', seriesname(o.Names, 1), ...
    'symbolSize', 18, 'rippleEffect', struct('scale', 3), ...
    'showEffectOn', 'render');
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
