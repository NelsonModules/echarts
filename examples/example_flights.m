%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Wow demo: a global flight network on a dark world map, with animated light
% trails flowing along the routes and pulsing hub cities (geo lines + effect
% scatter; the bundled world map is loaded automatically).
hubs = {[2.35 48.85], [-74 40.7], [139.7 35.7], [103.8 1.35]};
dests = {[-0.12 51.5], [-46.6 -23.5], [151.2 -33.87], [116.4 39.9], ...
  [72.8 19], [37.6 55.75], [31.2 30], [-118.2 34.05], [55.3 25.2], ...
  [13.4 52.5], [-99.1 19.4], [28.0 -26.2]};
links = {};
cities = {};
for h = 1:numel(hubs)
  cities{end + 1} = [hubs{h}, 100]; %#ok<SAGROW>
  for d = 1:numel(dests)
    if mod(d + h, 2) == 0
      links{end + 1} = struct('coords', {{hubs{h}, dests{d}}}); %#ok<SAGROW>
    end
  end
end
for d = 1:numel(dests)
  cities{end + 1} = [dests{d}, 45]; %#ok<SAGROW>
end
c = echarts.chart('lines');
c.Library = {'auto', 'worldmap'};
c.theme('dark');
c.option('legend.show', false);
c.option('tooltip.show', false);
c.option('geo', struct('map', 'world', 'roam', true, 'silent', true, ...
  'itemStyle', struct('areaColor', '#0b1a2b', 'borderColor', '#1f3b57'), ...
  'emphasis', struct('itemStyle', struct('areaColor', '#0b1a2b'))));
c.addSeries(links, 'coordinateSystem', 'geo', 'polyline', false, ...
  'lineStyle', struct('color', '#ffd166', 'width', 1, 'opacity', 0.4, 'curveness', 0.3), ...
  'effect', struct('show', true, 'period', 5, 'trailLength', 0.6, ...
  'symbol', 'arrow', 'symbolSize', 5, 'color', '#fff3c4'));
c.addSeries(cities, 'type', 'effectScatter', 'coordinateSystem', 'geo', ...
  'symbolSize', echarts.fn('(d) => 4 + d[2] / 12'), ...
  'rippleEffect', struct('brushType', 'stroke', 'scale', 3.5), ...
  'itemStyle', struct('color', '#ef476f'), 'zlevel', 2);
c.title('Global flight network');
c.show();
%=============================================================================
