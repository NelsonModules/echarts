%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Box plot: salaries by role.
mu = [45 60 80 95 110]; sd = [6 8 12 14 16];
G = cell(1, numel(mu));
for k = 1:numel(mu); G{k} = mu(k) + sd(k)*randn(1, 130); end
echarts.boxplot({'Jr','Mid','Sr','Lead','Mgr'}, G).title('Salaries by role').show();
%=============================================================================
