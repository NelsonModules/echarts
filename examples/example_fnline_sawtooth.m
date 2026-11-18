%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Line plot of sawtooth wave.
x = linspace(0, 4*pi, 300);
echarts.plot(x, 2*(x/2 - floor(x/2+0.5)), 'Names', {'Sawtooth wave'}).title('Sawtooth wave').show();
%=============================================================================
