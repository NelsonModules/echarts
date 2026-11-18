%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% 3D scatter: gaussian blob (echarts-gl).
x = randn(1,600); y = randn(1,600); z = randn(1,600);
echarts.scatter3D(x, y, z).title('Gaussian blob').show();
%=============================================================================
