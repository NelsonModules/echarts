%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Box plot: a/b test.
mu = [2.4 2.1]; sd = [0.6 0.5];
G = cell(1, numel(mu));
for k = 1:numel(mu); G{k} = mu(k) + sd(k)*randn(1, 200); end
echarts.boxplot({'Control','Variant'}, G).title('A/B test').show();
%=============================================================================
