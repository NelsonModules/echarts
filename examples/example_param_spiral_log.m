%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: logarithmic spiral.
t = linspace(0, 2*pi, 600);
x = exp(t/10).*cos(t); y = exp(t/10).*sin(t);
echarts.lines({[x.' y.']}).title('Logarithmic spiral').show();
%=============================================================================
