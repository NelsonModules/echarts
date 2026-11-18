%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A clean progress-ring gauge (no ticks, no pointer).
c = echarts.gauge(68, 'Min', 0, 'Max', 100, 'Name', 'Done');
c.title('Progress');
s = c.Option.series{1};
s.progress = struct('show', true, 'width', 18, 'roundCap', true);
s.axisLine = struct('lineStyle', struct('width', 18));
s.pointer = struct('show', false);
s.axisTick = struct('show', false);
s.splitLine = struct('show', false);
s.axisLabel = struct('show', false);
s.detail = struct('valueAnimation', true, 'formatter', '{value}%', ...
  'offsetCenter', {{0, '5%'}});
c.Option.series{1} = s;
c.show();
%=============================================================================
