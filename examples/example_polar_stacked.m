%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Stacked bars on a polar coordinate system.
cats = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
c = echarts.chart('bar');
c.Option = rmfield(c.Option, 'xAxis');
c.Option = rmfield(c.Option, 'yAxis');
c.Option = rmfield(c.Option, 'grid');
c.option('tooltip.trigger', 'item');
c.option('legend.show', true);
c.option('polar', struct());
c.option('angleAxis', struct('type', 'category', 'data', {cats}));
c.option('radiusAxis', struct());
c.addSeries([1 2 3 4 3 5 1], 'name', 'A', 'coordinateSystem', 'polar', 'stack', 'x');
c.addSeries([2 2 1 3 2 1 2], 'name', 'B', 'coordinateSystem', 'polar', 'stack', 'x');
c.addSeries([1 1 2 1 2 2 3], 'name', 'C', 'coordinateSystem', 'polar', 'stack', 'x');
c.title('Polar stacked bars');
c.show();
%=============================================================================
