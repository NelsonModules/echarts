%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A rotatable 3D surface (uses the bundled echarts-gl extension).
[X, Y] = meshgrid(linspace(-3, 3, 60));
Z = sin(X) .* cos(Y);
echarts.surface(X, Y, Z).title('sin(x) cos(y)').show();
%=============================================================================
