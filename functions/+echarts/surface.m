%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.surface(Z)
% c = echarts.surface(X, Y, Z)
% c = echarts.surface(..., 'Title', '...')
%   Create a 3D surface (uses the bundled echarts-gl extension). With one
%   argument Z is a height matrix over an implicit integer grid; with three,
%   X, Y and Z are matrices of the same size (as produced by meshgrid). The
%   surface is colored by height with a continuous visual map and can be rotated.
%
%   Example:
%     [X, Y] = meshgrid(linspace(-3, 3, 40));
%     Z = sin(X) .* cos(Y);
%     echarts.surface(X, Y, Z).title('sin(x)cos(y)').show();
function c = surface(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  switch numel(pos)
    case 1
      Z = double(pos{1});
      [X, Y] = meshgrid(1:size(Z, 2), 1:size(Z, 1));
    case 3
      X = double(pos{1});
      Y = double(pos{2});
      Z = double(pos{3});
    otherwise
      error('echarts:surface', 'Expected Z, or X, Y and Z.');
  end
  n = numel(Z);
  data = cell(n, 1);
  t = 0;
  for k = 1:n
    t = t + 1;
    data{t} = [X(k), Y(k), Z(k)];
  end
  c = make3d('surface');
  c.addSeries(data, 'shading', 'color', 'wireframe', struct('show', false));
  c.visualMap(min(Z(:)), max(Z(:)), 'dimension', 2, 'inRange', ...
    struct('color', {echarts.colormap('viridis')}), 'left', 10, 'bottom', 10);
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
