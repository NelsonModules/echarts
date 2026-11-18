%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Correlation matrix heatmap with a diverging color scale from -1 to 1.
vars = {'mpg', 'cyl', 'disp', 'hp', 'wt', 'qsec'};
X = randn(60, numel(vars));
X(:, 2) = -X(:, 1) + 0.3 * randn(60, 1);
X(:, 4) = X(:, 3) + 0.4 * randn(60, 1);
R = corrcoef(X);
c = echarts.heatmap(vars, vars, R);
c.title('Correlation matrix');
c.visualMap(-1, 1, 'inRange', struct('color', {echarts.colormap('rdylbu')}));
c.show();
%=============================================================================
