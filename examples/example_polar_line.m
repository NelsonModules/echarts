%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A spiral line drawn on a polar coordinate system.
t = linspace(0, 360 * 4, 400);
r = t / 20;
pts = cell(numel(t), 1);
for k = 1:numel(t)
  pts{k} = [r(k), t(k)];
end
c = echarts.chart('line');
c.Option = rmfield(c.Option, 'xAxis');
c.Option = rmfield(c.Option, 'yAxis');
c.Option = rmfield(c.Option, 'grid');
c.option('legend.show', false);
c.option('polar', struct());
c.option('angleAxis', struct('type', 'value', 'startAngle', 0));
c.option('radiusAxis', struct());
c.addSeries(pts, 'coordinateSystem', 'polar', 'symbol', 'none', ...
  'lineStyle', struct('width', 2));
c.title('Polar spiral');
c.show();
%=============================================================================
