%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Scatter of power law.
x = linspace(0, 12, 160); y = 0.5*x.^1.8 + 2*randn(1, numel(x));
echarts.scatter(x, y, 'Names', {'Power law'}).title('Power law').show();
%=============================================================================
