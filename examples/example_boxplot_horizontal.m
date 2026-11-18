%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Horizontal box plot (categories on the y-axis).
G = {randn(1, 120), 1 + 1.3 * randn(1, 120), ...
     -0.5 + 0.7 * randn(1, 120), 0.8 + 1.6 * randn(1, 120)};
c = echarts.boxplot({'A', 'B', 'C', 'D'}, G);
c.title('Horizontal distributions');
c.horizontal();
c.show();
%=============================================================================
