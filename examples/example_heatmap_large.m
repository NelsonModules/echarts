%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A larger heatmap (24 hours by 31 days) with a continuous visual map.
[H, D] = meshgrid(1:24, 1:31);
M = 40 + 30 * sin(H / 3) + 10 * cos(D / 5) + 8 * randn(size(H));
hours = cell(1, 24);
for k = 1:24
  hours{k} = sprintf('%d', k - 1);
end
days = cell(1, 31);
for k = 1:31
  days{k} = sprintf('%d', k);
end
c = echarts.heatmap(hours, days, M);
c.title('Hourly activity by day');
c.visualMap(min(M(:)), max(M(:)), 'inRange', ...
  struct('color', {echarts.colormap('inferno')}));
c.show();
%=============================================================================
