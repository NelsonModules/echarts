%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A speedometer gauge with a colored red zone and a pointer.
c = echarts.gauge(118, 'Min', 0, 'Max', 220, 'Name', 'km/h');
c.title('Speed');
s = c.Option.series{1};
s.splitNumber = 11;
s.axisLine = struct('lineStyle', struct('width', 6, 'color', ...
  {{{0.7, '#91cc75'}, {0.9, '#fac858'}, {1, '#ee6666'}}}));
s.anchor = struct('show', true, 'size', 14, 'itemStyle', struct('color', '#5470c6'));
s.detail = struct('valueAnimation', true, 'formatter', '{value}');
c.Option.series{1} = s;
c.show();
%=============================================================================
