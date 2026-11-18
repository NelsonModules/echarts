%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parametric curve: fermat spiral.
t = linspace(0, 2*pi, 600); x = sqrt(t).*cos(t); y = sqrt(t).*sin(t);
echarts.lines({[x.' y.']}).title('Fermat spiral').show();
%=============================================================================
