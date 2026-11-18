%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Box plot: exam scores.
mu = [70 75 68 80]; sd = [8 6 10 7];
G = cell(1, numel(mu));
for k = 1:numel(mu); G{k} = mu(k) + sd(k)*randn(1, 120); end
echarts.boxplot({'Class A','Class B','Class C','Class D'}, G).title('Exam scores').show();
%=============================================================================
