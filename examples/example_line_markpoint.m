%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Temperature change: mark the maximum and minimum points and the average line
% (the ECharts "Temperature Change" line example).
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
highs = [10 11 13 11 12 12 9];
lows = [1 -2 2 5 3 2 0];
c = echarts.line(days, [highs.', lows.'], 'Names', {'Highest', 'Lowest'});
c.title('Temperature');
c.smooth(true);
c.Option.series{1}.markPoint = struct('data', ...
  {{struct('type', 'max', 'name', 'Max'), struct('type', 'min', 'name', 'Min')}});
c.Option.series{1}.markLine = struct('data', {{struct('type', 'average', 'name', 'Avg')}});
c.show();
%=============================================================================
