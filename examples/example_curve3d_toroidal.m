%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% 3D curve: toroidal knot (echarts-gl).
t = linspace(0, 6*pi, 500);
echarts.line3D((2+cos(3*t)).*cos(2*t), (2+cos(3*t)).*sin(2*t), sin(3*t)).title('Toroidal knot').show();
%=============================================================================
