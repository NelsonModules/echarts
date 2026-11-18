%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Reference lines and a shaded band drawn over a line chart.
months = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'};
y = [12 14 9 15 22 19 24 18];
c = echarts.line(months, y, 'Names', {'Throughput'});
c.title('Throughput with targets');
c.hline(20, 'name', 'target', 'lineStyle', struct('color', '#e15759'));
c.yregion(13, 17, 'itemStyle', struct('color', 'rgba(250,200,80,0.15)'));
c.show();
%=============================================================================
