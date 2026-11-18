%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A histogram of a normally distributed sample.
echarts.hist(randn(1, 2000), 24) ...
  .title('Normal sample (n = 2000)') ...
  .ylabel('count') ...
  .show();
%=============================================================================
