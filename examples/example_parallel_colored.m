%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parallel coordinates colored by a score dimension with a visual map.
dims = {'Price', 'Power', 'Weight', 'Range', 'Comfort', 'Score'};
rows = 30;
M = [20 + 30 * rand(rows, 1), 90 + 180 * rand(rows, 1), ...
     0.9 + rand(rows, 1), 350 + 300 * rand(rows, 1), ...
     4 + 5 * rand(rows, 1), round(100 * rand(rows, 1))];
c = echarts.parallel(dims, M);
c.title('Vehicle comparison');
c.Option.visualMap = struct('min', 0, 'max', 100, 'dimension', 5, ...
  'calculable', true, 'right', 12, 'top', 'middle', ...
  'inRange', struct('color', {echarts.colormap('turbo')}));
c.Option.series{1}.lineStyle = struct('width', 1.5, 'opacity', 0.5);
c.show();
%=============================================================================
