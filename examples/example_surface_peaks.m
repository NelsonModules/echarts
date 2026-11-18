%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% The classic "peaks" surface in 3D (uses the bundled echarts-gl extension).
[X, Y] = meshgrid(linspace(-3, 3, 60));
Z = 3 * (1 - X) .^ 2 .* exp(-(X .^ 2) - (Y + 1) .^ 2) ...
  - 10 * (X / 5 - X .^ 3 - Y .^ 5) .* exp(-X .^ 2 - Y .^ 2) ...
  - 1 / 3 * exp(-(X + 1) .^ 2 - Y .^ 2);
echarts.surface(X, Y, Z).title('Peaks').show();
%=============================================================================
