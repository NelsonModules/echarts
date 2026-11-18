%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Large-scale scatter: thousands of points drawn with the fast large mode.
n = 6000;
x = randn(1, n);
y = x + 0.6 * randn(1, n);
c = echarts.scatter(x, y, 'Names', {'samples'});
c.title(sprintf('Large scatter (%d points)', n));
c.Option.series{1}.large = true;
c.Option.series{1}.largeThreshold = 2000;
c.Option.series{1}.symbolSize = 4;
c.show();
%=============================================================================
