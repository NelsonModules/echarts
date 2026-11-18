%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Wow demo in the spirit of the ECharts "linesGL" examples: hundreds of flight
% arcs drawn as glowing lines with additive blending over a dark world map. The
% routes are synthetic, sampled between major world cities. (The GPU linesGL
% series of echarts-gl does not render with the bundled ECharts 5 core, so the
% same look is built with the canvas-based lines series.)
cities = [ -73.94 40.67;    % New York
          -118.24 34.05;    % Los Angeles
           -87.63 41.88;    % Chicago
          -122.42 37.77;    % San Francisco
           -79.38 43.65;    % Toronto
           -99.13 19.43;    % Mexico City
           -46.63 -23.55;   % Sao Paulo
           -43.17 -22.90;   % Rio de Janeiro
            -0.12 51.50;    % London
             2.35 48.85;    % Paris
             8.68 50.11;    % Frankfurt
            37.62 55.75;    % Moscow
            28.98 41.01;    % Istanbul
            31.24 30.04;    % Cairo
            28.05 -26.20;   % Johannesburg
            36.82 -1.29;    % Nairobi
            55.27 25.20;    % Dubai
            72.88 19.08;    % Mumbai
           116.40 39.90;    % Beijing
           121.47 31.23;    % Shanghai
           114.17 22.32;    % Hong Kong
           139.69 35.68;    % Tokyo
           103.85 1.29;     % Singapore
           151.21 -33.87];  % Sydney
% One arc per data item, each given as its endpoints under coords:
% {[fromLng fromLat], [toLng toLat]}. The items are collected in a cell.
N = 800;
routes = cell(1, N);
for k = 1:N
  a = cities(randi(size(cities, 1)), :);
  b = cities(randi(size(cities, 1)), :);
  routes{k} = struct('coords', {{[a(1), a(2)], [b(1), b(2)]}});
end
opt = struct();
opt.backgroundColor = '#000';
opt.title = struct('text', 'World flight arcs', 'left', 'center', ...
  'textStyle', struct('color', '#eaeaea'));
% A faint land fill keeps the continents readable under the glow.
opt.geo = struct('map', 'world', 'roam', true, 'silent', true, ...
  'itemStyle', struct('areaColor', '#0a0f1e', 'borderColor', '#1b2440'), ...
  'emphasis', struct('itemStyle', struct('areaColor', '#0a0f1e')));
% curveness bends each route into an arc; additive blending makes overlapping
% arcs build up into a bright glow.
series = struct('type', 'lines', 'coordinateSystem', 'geo', ...
  'lineStyle', struct('color', '#ffd27f', 'opacity', 0.22, 'width', 1, ...
  'curveness', 0.3));
series.data = routes;
opt.series = {series};
c = echarts.fromOption(opt);
c.Library = {'auto', 'worldmap'};
c.show();
%=============================================================================
