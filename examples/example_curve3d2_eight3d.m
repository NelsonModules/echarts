%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% 3D curve: 3d eight (echarts-gl).
t = linspace(0, 6*pi, 500);
echarts.line3D(sin(2*t), sin(t), cos(t)).title('3D eight').show();
%=============================================================================
