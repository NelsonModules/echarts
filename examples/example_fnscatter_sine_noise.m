%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Scatter of noisy sine.
x = linspace(0, 12, 160);
y = 8*sin(x/2) + 1.5*randn(1, numel(x));
echarts.scatter(x, y, 'Names', {'Noisy sine'}).title('Noisy sine').show();
%=============================================================================
