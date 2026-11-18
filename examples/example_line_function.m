%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Smooth function plots over a numeric x axis with echarts.plot.
x = linspace(0, 2 * pi, 200);
echarts.plot(x, [sin(x).', cos(x).', (0.5 * sin(2 * x)).'], ...
  'Names', {'sin', 'cos', 'sin2/2'}) ...
  .title('Trigonometric functions') ...
  .xlabel('x') ...
  .dataZoom('x') ...
  .show();
%=============================================================================
