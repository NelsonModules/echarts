%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% 3D surface: mexican hat (echarts-gl).
[X, Y] = meshgrid(linspace(-3, 3, 55));
Z = (1-(X.^2+Y.^2)/2).*exp(-(X.^2+Y.^2)/4);
echarts.surface(X, Y, Z).title('Mexican hat').show();
%=============================================================================
