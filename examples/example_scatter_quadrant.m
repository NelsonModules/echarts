%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Scatter with mean reference lines splitting the plane into quadrants.
x = 50 + 15 * randn(1, 80);
y = 50 + 15 * randn(1, 80);
c = echarts.scatter(x, y, 'Names', {'items'});
c.title('Quadrant analysis');
c.xlabel('effort');
c.ylabel('impact');
c.vline(mean(x), 'lineStyle', struct('type', 'dashed', 'color', '#888'));
c.hline(mean(y), 'lineStyle', struct('type', 'dashed', 'color', '#888'));
c.show();
%=============================================================================
