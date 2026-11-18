%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: rose r=cos(7t).
t = linspace(0, 2*pi, 600); x = cos(7*t).*cos(t); y = cos(7*t).*sin(t);
echarts.lines({[x.' y.']}).title('Rose r=cos(7t)').show();
%=============================================================================
