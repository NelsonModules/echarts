%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A calendar heatmap: one colored cell per day over a whole year.
days = datetime(2024, 1, 1):datetime(2024, 12, 31);
values = 10 + 10 * sin((1:numel(days)) / 18) + 4 * randn(1, numel(days));
echarts.calendar(days, values, 'Range', '2024') ...
  .title('Daily commits 2024') ...
  .show();
%=============================================================================
