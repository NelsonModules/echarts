%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Scatter of periodic cloud.
x = linspace(0, 12, 160); y = 5+5*cos(x) + 1*randn(1, numel(x));
echarts.scatter(x, y, 'Names', {'Periodic cloud'}).title('Periodic cloud').show();
%=============================================================================
