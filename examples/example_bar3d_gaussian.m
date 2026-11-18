%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% 3D bars shaped as a 2D Gaussian (uses the bundled echarts-gl extension).
[X, Y] = meshgrid(1:14, 1:14);
Z = round(60 * exp(-((X - 7) .^ 2 + (Y - 7) .^ 2) / 10));
echarts.bar3D(Z).title('Gaussian bars').show();
%=============================================================================
