%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: butterfly curve.
t = linspace(0, 2*pi, 600);
x = sin(t).*(exp(cos(t))-2*cos(4*t)).*cos(t); y = sin(t).*(exp(cos(t))-2*cos(4*t)).*sin(t);
echarts.lines({[x.' y.']}).title('Butterfly curve').show();
%=============================================================================
