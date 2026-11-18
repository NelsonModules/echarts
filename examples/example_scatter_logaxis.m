%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Scatter on log-log axes (a power law y = x^2 with noise).
x = 10 .^ (0.2 * (1:25));
y = (x .^ 2) .* (0.7 + 0.6 * rand(1, 25));
c = echarts.scatter(x, y, 'Names', {'y ~ x^2'});
c.title('Log-log scatter');
c.logscale('x');
c.logscale('y');
c.show();
%=============================================================================
