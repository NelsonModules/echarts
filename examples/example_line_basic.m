%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A basic line chart over weekday categories, using the fluent chained API.
echarts.line({'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'}, ...
  [150 230 224 218 135 147 260], 'Names', {'Visits'}) ...
  .title('Weekly traffic') ...
  .ylabel('visits') ...
  .smooth(true) ...
  .show();
%=============================================================================
