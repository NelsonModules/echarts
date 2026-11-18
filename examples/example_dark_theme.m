%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% The same data rendered with the built-in dark theme.
months = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'};
echarts.line(months, [820 932 901 934 1290 1330], 'Names', {'Users'}) ...
  .title('Monthly active users') ...
  .area(true) ...
  .smooth(true) ...
  .theme('dark') ...
  .show();
%=============================================================================
