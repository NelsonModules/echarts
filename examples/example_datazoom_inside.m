%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Inside zoom on both axes (scroll to zoom, drag to pan) without sliders.
n = 400;
x = linspace(0, 40, n);
y = sin(x) .* exp(-x / 40) + 0.05 * randn(1, n);
c = echarts.plot(x, y, 'Names', {'Damped'});
c.title('Inside zoom (x and y)');
c.Option.series{1}.symbol = 'none';
c.Option.dataZoom = {struct('type', 'inside', 'xAxisIndex', 0), ...
  struct('type', 'inside', 'yAxisIndex', 0)};
c.show();
%=============================================================================
