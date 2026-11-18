%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% 3D scatter: sphere shell (echarts-gl).
n = 700;
u = 2*pi*rand(1,n); v = acos(2*rand(1,n)-1);
x = cos(u).*sin(v); y = sin(u).*sin(v); z = cos(v);
echarts.scatter3D(x, y, z).title('Sphere shell').show();
%=============================================================================
