%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Radial polar bars: categories on the radius axis, value along the angle (the
% ECharts "Radial Polar Bar Label" layout).
cats = {'a', 'b', 'c', 'd', 'e'};
values = [2 1.2 2.4 3.6 1.8];
c = echarts.chart('bar');
c.Option = rmfield(c.Option, 'xAxis');
c.Option = rmfield(c.Option, 'yAxis');
c.Option = rmfield(c.Option, 'grid');
c.option('legend.show', false);
c.option('polar', struct('radius', {{30, '80%'}}));
c.option('angleAxis', struct('max', 4, 'startAngle', 75));
c.option('radiusAxis', struct('type', 'category', 'data', {cats}));
c.addSeries(values, 'coordinateSystem', 'polar', ...
  'label', struct('show', true, 'position', 'middle', 'formatter', '{b}: {c}'));
c.title('Radial polar bars');
c.show();
%=============================================================================
