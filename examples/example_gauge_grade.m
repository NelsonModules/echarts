%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Gauge with colored grade bands on the dial (red / amber / green).
c = echarts.gauge(0.72, 'Min', 0, 'Max', 1, 'Name', 'Score');
c.title('Grade gauge');
c.Option.series{1}.axisLine = struct('lineWidth', 18, 'color', ...
  {{{0.3, '#ee6666'}, {0.7, '#fac858'}, {1, '#91cc75'}}});
c.Option.series{1}.detail = struct('valueAnimation', true, ...
  'formatter', echarts.fn('(v) => (v*100).toFixed(0) + "%"'));
c.show();
%=============================================================================
