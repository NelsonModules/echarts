%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: cardioid.
t = linspace(0, 2*pi, 600);
x = (1-cos(t)).*cos(t); y = (1-cos(t)).*sin(t);
echarts.lines({[x.' y.']}).title('Cardioid').show();
%=============================================================================
