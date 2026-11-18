%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A scatter plot whose point color is driven by the y value via a visual map.
x = linspace(-3, 3, 160);
y = x .^ 2 + 0.6 * randn(1, 160);
c = echarts.scatter(x, y, 'Names', {'samples'});
c.title('Colored by value');
c.visualMap(min(y), max(y), 'dimension', 1, 'inRange', ...
  struct('color', {echarts.colormap('viridis')}));
c.show();
%=============================================================================
