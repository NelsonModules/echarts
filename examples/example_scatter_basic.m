%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A scatter chart of two correlated variables, with a fitted trend line.
x = linspace(0, 10, 120) + 0.4 * randn(1, 120);
y = 2.2 * x + 3 + 2.5 * randn(1, 120);
c = echarts.scatter(x, y, 'Names', {'samples'});
c.title('Correlation');
c.trendline();
c.show();
%=============================================================================
