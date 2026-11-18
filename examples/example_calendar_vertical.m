%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Calendar heatmap laid out vertically.
days = datetime(2024, 1, 1):datetime(2024, 6, 30);
values = 5 + 5 * abs(sin((1:numel(days)) / 12)) + 3 * rand(1, numel(days));
c = echarts.calendar(days, values, 'Range', {'2024-01-01', '2024-06-30'});
c.title('First half 2024');
c.Option.calendar.orient = 'vertical';
c.Option.calendar.cellSize = {16, 16};
c.show();
%=============================================================================
