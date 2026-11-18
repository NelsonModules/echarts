%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: lissajous 3:2.
t = linspace(0, 2*pi, 600);
x = sin(3*t); y = sin(2*t);
echarts.lines({[x.' y.']}).title('Lissajous 3:2').show();
%=============================================================================
