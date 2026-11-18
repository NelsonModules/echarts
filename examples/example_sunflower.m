%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Wow demo: a phyllotaxis "sunflower" (golden-angle spiral) of 1800 seeds that
% bloom outward one by one (staggered animationDelay), colored by radius.
n = 1800;
golden = pi * (3 - sqrt(5));
i = (0:n - 1);
r = sqrt(i);
th = i * golden;
x = r .* cos(th);
y = r .* sin(th);
pts = cell(n, 1);
for k = 1:n
  pts{k} = [x(k), y(k), r(k)];
end
c = echarts.chart('scatter');
c.title('Phyllotaxis');
c.option('legend.show', false);
c.option('tooltip.show', false);
c.option('xAxis', struct('show', false, 'scale', true));
c.option('yAxis', struct('show', false, 'scale', true));
c.option('grid', struct('left', 10, 'right', 10, 'top', 40, 'bottom', 10));
c.addSeries(pts, 'symbolSize', 7, ...
  'animationDelay', echarts.fn('(idx) => idx * 2'), ...
  'animationEasing', 'cubicOut');
c.visualMap(0, max(r), 'dimension', 2, 'show', false, 'inRange', ...
  struct('color', {echarts.colormap('viridis')}));
c.show();
%=============================================================================
