%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: deltoid.
t = linspace(0, 2*pi, 600);
x = 2*cos(t)+cos(2*t); y = 2*sin(t)-sin(2*t);
echarts.lines({[x.' y.']}).title('Deltoid').show();
%=============================================================================
