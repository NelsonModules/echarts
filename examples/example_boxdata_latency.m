%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Box plot: response time.
mu = [50 30 5 15]; sd = [12 8 2 6];
G = cell(1, numel(mu));
for k = 1:numel(mu); G{k} = mu(k) + sd(k)*randn(1, 140); end
echarts.boxplot({'API','DB','Cache','Queue'}, G).title('Response time').show();
%=============================================================================
