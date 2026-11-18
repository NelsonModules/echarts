%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Scatter points placed on the world map by longitude / latitude, sized by
% value (the bundled world map is loaded automatically).
cities = { ...
  [2.35 48.85 80], [-0.12 51.5 65], [-74 40.7 95], [139.7 35.7 88], ...
  [151.2 -33.87 40], [-46.6 -23.5 55], [31.2 30 38], [37.6 55.75 60], ...
  [116.4 39.9 92], [72.8 19 70]};
c = echarts.chart('scatter');
c.Library = {'auto', 'worldmap'};
c.Option = rmfield(c.Option, 'xAxis');
c.Option = rmfield(c.Option, 'yAxis');
c.Option = rmfield(c.Option, 'grid');
c.option('legend.show', false);
c.option('tooltip.trigger', 'item');
c.option('geo', struct('map', 'world', 'roam', true, ...
  'itemStyle', struct('areaColor', '#f3f3f3', 'borderColor', '#bbb')));
c.addSeries(cities, 'coordinateSystem', 'geo', ...
  'symbolSize', echarts.fn('(d) => Math.sqrt(d[2]) * 2.2'), ...
  'itemStyle', struct('color', '#ee6666'));
c.title('City activity');
c.show();
%=============================================================================
