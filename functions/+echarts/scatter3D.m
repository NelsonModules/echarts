%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.scatter3D(x, y, z)
% c = echarts.scatter3D(..., 'Title', '...')
%   Create a 3D scatter chart (uses the bundled echarts-gl extension). x, y and z
%   are vectors of the same length; points are colored by z with a continuous
%   visual map and the scene can be rotated.
%
%   Example:
%     t = linspace(0, 6*pi, 300);
%     echarts.scatter3D(cos(t).*t, sin(t).*t, t).title('Spiral').show();
function c = scatter3D(x, y, z, varargin)
  o = factoryopts(varargin);
  x = double(x(:));
  y = double(y(:));
  z = double(z(:));
  n = numel(x);
  if numel(y) ~= n || numel(z) ~= n
    error('echarts:scatter3D', 'x, y and z must be the same length.');
  end
  data = cell(n, 1);
  for k = 1:n
    data{k} = [x(k), y(k), z(k)];
  end
  c = make3d('scatter3D');
  c.addSeries(data, 'symbolSize', 8);
  c.visualMap(min(z), max(z), 'dimension', 2, 'inRange', ...
    struct('color', {echarts.colormap('turbo')}), 'left', 10, 'bottom', 10);
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
