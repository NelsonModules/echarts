%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: heart curve.
t = linspace(0, 2*pi, 600); x = 16*sin(t).^3/16; y = (13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t))/16;
echarts.lines({[x.' y.']}).title('Heart curve').show();
%=============================================================================
