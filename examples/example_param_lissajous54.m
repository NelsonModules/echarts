%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: lissajous 5:4.
t = linspace(0, 2*pi, 600);
x = sin(5*t); y = sin(4*t + pi/4);
echarts.lines({[x.' y.']}).title('Lissajous 5:4').show();
%=============================================================================
