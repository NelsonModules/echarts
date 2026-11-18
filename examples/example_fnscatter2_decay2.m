%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Scatter of decaying scatter.
x = linspace(0, 12, 160); y = 20*exp(-x/5) + 1*randn(1, numel(x));
echarts.scatter(x, y, 'Names', {'Decaying scatter'}).title('Decaying scatter').show();
%=============================================================================
