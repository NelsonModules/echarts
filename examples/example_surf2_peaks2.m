%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% 3D surface: twin peaks (echarts-gl).
[X, Y] = meshgrid(linspace(-3, 3, 55)); Z = exp(-((X-1).^2+Y.^2)) + exp(-((X+1).^2+Y.^2));
echarts.surface(X, Y, Z).title('Twin peaks').show();
%=============================================================================
