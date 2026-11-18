%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% 3D curve: viviani curve (echarts-gl).
t = linspace(0, 6*pi, 500);
echarts.line3D(1+cos(t), sin(t), 2*sin(t/2)).title('Viviani curve').show();
%=============================================================================
