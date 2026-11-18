%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.line3D(x, y, z)
% c = echarts.line3D(..., 'Title', '...')
%   Create a 3D line / curve (uses the bundled echarts-gl extension). x, y and z
%   are vectors of the same length tracing a space curve that can be rotated.
%
%   Example:
%     t = linspace(0, 10*pi, 600);
%     echarts.line3D(cos(t), sin(t), t/pi).title('Helix').show();
function c = line3D(x, y, z, varargin)
  o = factoryopts(varargin);
  x = double(x(:));
  y = double(y(:));
  z = double(z(:));
  n = numel(x);
  if numel(y) ~= n || numel(z) ~= n
    error('echarts:line3D', 'x, y and z must be the same length.');
  end
  data = cell(n, 1);
  for k = 1:n
    data{k} = [x(k), y(k), z(k)];
  end
  c = make3d('line3D');
  c.addSeries(data, 'lineStyle', struct('width', 4));
  c.visualMap(min(z), max(z), 'dimension', 2, 'inRange', ...
    struct('color', {echarts.colormap('plasma')}), 'left', 10, 'bottom', 10);
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
