%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: archimedean spiral.
t = linspace(0, 2*pi, 600);
x = (t/6).*cos(t); y = (t/6).*sin(t);
echarts.lines({[x.' y.']}).title('Archimedean spiral').show();
%=============================================================================
