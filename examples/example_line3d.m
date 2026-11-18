%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A rotatable 3D helix (uses the bundled echarts-gl extension).
t = linspace(0, 10 * pi, 600);
echarts.line3D(cos(t), sin(t), t / pi).title('Helix').show();
%=============================================================================
