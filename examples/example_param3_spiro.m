%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: spirograph.
t = linspace(0, 2*pi, 600); x = cos(t)+cos(7*t)/2; y = sin(t)+sin(7*t)/2;
echarts.lines({[x.' y.']}).title('Spirograph').show();
%=============================================================================
