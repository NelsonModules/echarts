%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A box-and-whisker plot of four samples with different spreads and centers.
g = {1.0 + 0.6 * randn(1, 200), 2.0 + 1.0 * randn(1, 200), ...
     0.5 + 0.4 * randn(1, 200), 1.5 + 1.4 * randn(1, 200)};
echarts.boxplot({'A', 'B', 'C', 'D'}, g) ...
  .title('Distributions') ...
  .ylabel('value') ...
  .show();
%=============================================================================
