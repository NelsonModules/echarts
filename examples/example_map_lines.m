%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Flight paths on the world map: animated great-circle style arcs from a hub.
hub = [2.35 48.85];
dest = {[-74 40.7], [139.7 35.7], [151.2 -33.87], [-46.6 -23.5], ...
  [116.4 39.9], [72.8 19], [37.6 55.75]};
links = cell(numel(dest), 1);
for k = 1:numel(dest)
  links{k} = struct('coords', {{hub, dest{k}}});
end
c = echarts.chart('lines');
c.Library = {'auto', 'worldmap'};
c.option('legend.show', false);
c.option('geo', struct('map', 'world', 'roam', true, ...
  'itemStyle', struct('areaColor', '#1b2a3a', 'borderColor', '#3b4a5a')));
c.addSeries(links, 'coordinateSystem', 'geo', ...
  'lineStyle', struct('color', '#ffd54f', 'width', 1, 'opacity', 0.6, 'curveness', 0.3), ...
  'effect', struct('show', true, 'period', 5, 'trailLength', 0.4, ...
  'color', '#fff', 'symbolSize', 3));
c.title('Flights from Paris');
c.show();
%=============================================================================
