%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% 3D scatter: stacked rings (echarts-gl).
a=linspace(0,2*pi,600); x=cos(a).*(1+0.1*randn(1,600)); y=sin(a).*(1+0.1*randn(1,600)); z=floor(linspace(0,4,600));
echarts.scatter3D(x, y, z).title('Stacked rings').show();
%=============================================================================
