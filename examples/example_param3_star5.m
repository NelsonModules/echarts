%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: five-point star.
t = linspace(0, 2*pi, 600); x = cos(t)+0.4*cos(5*t); y = sin(t)+0.4*sin(5*t);
echarts.lines({[x.' y.']}).title('Five-point star').show();
%=============================================================================
