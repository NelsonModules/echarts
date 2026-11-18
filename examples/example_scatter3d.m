%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A rotatable 3D scatter tracing a spiral (uses the bundled echarts-gl extension).
t = linspace(0, 6 * pi, 400);
echarts.scatter3D(cos(t) .* t, sin(t) .* t, t).title('Spiral').show();
%=============================================================================
