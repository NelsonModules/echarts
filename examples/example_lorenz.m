%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Wow demo: the Lorenz strange attractor as a glowing 3D curve that auto-rotates
% (uses the bundled echarts-gl extension). The ribbon is colored by height.
sigma = 10; rho = 28; beta = 8 / 3;
dt = 0.008; N = 6000;
x = zeros(1, N); y = x; z = x;
x(1) = 1; y(1) = 1; z(1) = 1;
for k = 1:N - 1
  x(k + 1) = x(k) + dt * sigma * (y(k) - x(k));
  y(k + 1) = y(k) + dt * (x(k) * (rho - z(k)) - y(k));
  z(k + 1) = z(k) + dt * (x(k) * y(k) - beta * z(k));
end
c = echarts.line3D(x, y, z);
c.title('Lorenz attractor');
c.theme('dark');
c.Option.series{1}.lineStyle.width = 3;
c.Option.grid3D.viewControl.autoRotate = true;
c.Option.grid3D.viewControl.autoRotateSpeed = 14;
c.Option.grid3D.viewControl.distance = 190;
c.Option.visualMap.inRange.color = echarts.colormap('turbo');
c.show();
%=============================================================================
