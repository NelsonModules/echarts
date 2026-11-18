%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Line plot of gaussian bell.
x = linspace(0, 4*pi, 300);
echarts.plot(x, exp(-(x-6).^2/3), 'Names', {'Gaussian bell'}).title('Gaussian bell').show();
%=============================================================================
