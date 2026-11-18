%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Scatter of heavy tail.
x = linspace(0, 12, 160); y = x + 0.3*x.^2 + 3*randn(1, numel(x));
echarts.scatter(x, y, 'Names', {'Heavy tail'}).title('Heavy tail').show();
%=============================================================================
