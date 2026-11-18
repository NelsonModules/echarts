%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% The ECharts toolbox adds save-as-image, a zoom brush, a data view and a
% line/bar switch directly on the chart.
x = 1:30;
y = 50 + cumsum(randn(1, 30));
echarts.line(x, y, 'Names', {'Signal'}) ...
  .title('Instrumented chart') ...
  .toolbox() ...
  .dataZoom('x') ...
  .show();
%=============================================================================
