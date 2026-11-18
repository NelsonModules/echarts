%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: epicycloid.
t = linspace(0, 2*pi, 600);
x = 4*cos(t)-cos(4*t); y = 4*sin(t)-sin(4*t);
echarts.lines({[x.' y.']}).title('Epicycloid').show();
%=============================================================================
