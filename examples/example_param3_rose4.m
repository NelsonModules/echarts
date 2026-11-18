%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: rose r=sin(4t).
t = linspace(0, 2*pi, 600); x = sin(4*t).*cos(t); y = sin(4*t).*sin(t);
echarts.lines({[x.' y.']}).title('Rose r=sin(4t)').show();
%=============================================================================
