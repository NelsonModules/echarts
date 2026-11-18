%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Step line chart: the three ECharts step modes (start, middle, end).
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
c = echarts.line(days, [120 132 101 134 90 230 210], 'Names', {'Step Start'});
c.Option.series{1}.step = 'start';
c.addSeries([220 282 201 234 290 430 410], 'name', 'Step Middle', 'step', 'middle');
c.addSeries([450 432 401 454 590 530 510], 'name', 'Step End', 'step', 'end');
c.title('Step line');
c.show();
%=============================================================================
