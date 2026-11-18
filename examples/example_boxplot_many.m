%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Box plot of eight samples with shifting centers and spreads.
G = cell(1, 8);
labels = cell(1, 8);
for k = 1:8
  G{k} = 0.4 * k + (0.5 + 0.12 * k) * randn(1, 140);
  labels{k} = sprintf('S%d', k);
end
echarts.boxplot(labels, G) ...
  .title('Eight distributions') ...
  .ylabel('value') ...
  .show();
%=============================================================================
