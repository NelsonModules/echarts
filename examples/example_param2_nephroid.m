%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: nephroid.
t = linspace(0, 2*pi, 600); x = 3*cos(t)-cos(3*t); y = 3*sin(t)-sin(3*t);
echarts.lines({[x.' y.']}).title('Nephroid').show();
%=============================================================================
