%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = make3d(type)
%   Build a chart on a 3D cartesian coordinate system (echarts-gl): it strips the
%   2D grid and axes, adds xAxis3D / yAxis3D / zAxis3D and grid3D, hides the
%   legend and opts into the bundled 'gl' extension. Shared by surface, bar3D,
%   scatter3D and line3D.
function c = make3d(type)
  c = echarts.chart(type);
  for f = {'xAxis', 'yAxis', 'grid'}
    if isfield(c.Option, f{1})
      c.Option = rmfield(c.Option, f{1});
    end
  end
  c.Option.xAxis3D = struct('type', 'value', 'name', 'x');
  c.Option.yAxis3D = struct('type', 'value', 'name', 'y');
  c.Option.zAxis3D = struct('type', 'value', 'name', 'z');
  c.Option.grid3D = struct('viewControl', struct('autoRotate', false, ...
    'distance', 220, 'alpha', 22, 'beta', 40), 'boxWidth', 100, ...
    'boxDepth', 80, 'boxHeight', 80);
  c.Option.legend.show = false;
  c.Library = {'auto', 'gl'};
end
%=============================================================================
