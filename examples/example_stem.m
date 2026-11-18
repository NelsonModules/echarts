%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A stem plot of a damped sinusoid.
n = 0:40;
y = exp(-n / 20) .* sin(n / 3);
echarts.stem(n, y).title('Damped impulse response').show();
%=============================================================================
