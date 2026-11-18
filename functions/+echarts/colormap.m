%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% stops = echarts.colormap(name)
%   Return a cell array of hex color stops for a continuous colormap, ready to
%   pass to a visual map as its 'inRange' color list. Named colormaps: 'viridis'
%   (default), 'plasma', 'inferno', 'jet', 'turbo', 'spectral', 'blues', 'reds',
%   'greens', 'rdylbu'.
%
%   Example:
%     c = echarts.heatmap(magic(8));
%     c.visualMap(1, 64, 'inRange', struct('color', {echarts.colormap('turbo')}));
function stops = colormap(name)
  if nargin < 1 || isempty(name)
    name = 'viridis';
  end
  switch lower(char(name))
    case 'plasma'
      stops = {'#0d0887', '#6a00a8', '#b12a90', '#e16462', '#fca636', '#f0f921'};
    case 'inferno'
      stops = {'#000004', '#420a68', '#932667', '#dd513a', '#fca50a', '#fcffa4'};
    case 'jet'
      stops = {'#000080', '#0000ff', '#00ffff', '#ffff00', '#ff0000', '#800000'};
    case 'turbo'
      stops = {'#30123b', '#4145ab', '#1ae4b6', '#a0fd3b', '#fd8524', '#7a0403'};
    case 'spectral'
      stops = {'#3288bd', '#99d594', '#e6f598', '#fee08b', '#fc8d59', '#d53e4f'};
    case 'blues'
      stops = {'#f7fbff', '#deebf7', '#9ecae1', '#4292c6', '#2171b5', '#08306b'};
    case 'reds'
      stops = {'#fff5f0', '#fee0d2', '#fcbba1', '#fb6a4a', '#cb181d', '#67000d'};
    case 'greens'
      stops = {'#f7fcf5', '#e5f5e0', '#a1d99b', '#41ab5d', '#238b45', '#00441b'};
    case 'rdylbu'
      stops = {'#d73027', '#fc8d59', '#fee090', '#e0f3f8', '#91bfdb', '#4575b4'};
    otherwise
      stops = {'#440154', '#414487', '#2a788e', '#22a884', '#7ad151', '#fde725'};
  end
end
%=============================================================================
