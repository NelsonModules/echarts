%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Large-scale area chart: a long random walk over a numeric axis with a zoom
% slider (ECharts "Large scale area chart").
n = 2000;
x = (1:n);
y = 100 + cumsum(randn(1, n));
c = echarts.plot(x, y, 'Names', {'Signal'});
c.title(sprintf('Large area (%d points)', n));
c.area(true);
c.Option.series{1}.sampling = 'lttb';
c.Option.series{1}.symbol = 'none';
c.dataZoom('x');
c.show();
%=============================================================================
