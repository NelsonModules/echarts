%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Line plot of clamped tangent.
x = linspace(0, 4*pi, 300);
echarts.plot(x, max(min(tan(x/2),8),-8), 'Names', {'Clamped tangent'}).title('Clamped tangent').show();
%=============================================================================
