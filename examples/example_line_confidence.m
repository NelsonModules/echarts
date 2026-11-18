%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Confidence band: a central line with a shaded band between a lower and an
% upper bound (built as a stacked transparent base plus a filled thickness).
x = 0:0.5:10;
mid = sin(x) + 0.05 * x;
band = 0.4 + 0.1 * x;
lower = mid - band;
thick = 2 * band;
labels = arrayfun(@(v) sprintf('%.1f', v), x, 'UniformOutput', false);
c = echarts.chart('line');
c.labels(labels);
c.option('xAxis.boundaryGap', false);
c.option('legend.show', false);
% Invisible base at the lower bound, then a translucent band of the thickness.
c.addSeries(lower, 'name', 'L', 'stack', 'band', 'symbol', 'none', ...
  'lineStyle', struct('opacity', 0));
c.addSeries(thick, 'name', 'band', 'stack', 'band', 'symbol', 'none', ...
  'lineStyle', struct('opacity', 0), ...
  'areaStyle', struct('color', 'rgba(70,130,180,0.25)'));
c.addSeries(mid, 'name', 'mean', 'symbol', 'none', ...
  'lineStyle', struct('color', '#4682b4', 'width', 2));
c.title('Confidence band');
c.show();
%=============================================================================
