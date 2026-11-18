%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Box plot: sensor noise.
mu = [0 0.2 -0.1 0.3 0.1]; sd = [1 1.5 0.8 1.2 0.9];
G = cell(1, numel(mu));
for k = 1:numel(mu); G{k} = mu(k) + sd(k)*randn(1, 150); end
echarts.boxplot({'S1','S2','S3','S4','S5'}, G).title('Sensor noise').show();
%=============================================================================
