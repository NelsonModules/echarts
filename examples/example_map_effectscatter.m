%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Pulsing markers at major cities on the world map (effect scatter on geo).
cities = {[-74 40.7 95], [139.7 35.7 88], [116.4 39.9 92], ...
  [2.35 48.85 80], [-0.12 51.5 65]};
c = echarts.chart('effectScatter');
c.Library = {'auto', 'worldmap'};
c.Option = rmfield(c.Option, 'xAxis');
c.Option = rmfield(c.Option, 'yAxis');
c.Option = rmfield(c.Option, 'grid');
c.option('legend.show', false);
c.option('tooltip.trigger', 'item');
c.option('geo', struct('map', 'world', 'roam', true, ...
  'itemStyle', struct('areaColor', '#f3f3f3', 'borderColor', '#bbb')));
c.addSeries(cities, 'coordinateSystem', 'geo', ...
  'symbolSize', echarts.fn('(d) => d[2] / 6'), 'showEffectOn', 'render', ...
  'rippleEffect', struct('scale', 4), 'itemStyle', struct('color', '#d7191c'));
c.title('Hotspots');
c.show();
%=============================================================================
