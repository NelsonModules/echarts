%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Waterfall chart (the ECharts technique): a transparent placeholder stack lifts
% each floating bar, with rises and falls drawn as two colored series.
steps = {'Base', 'Q1', 'Q2', 'Q3', 'Q4', 'Dip'};
delta = [900 345 -120 430 -200 -150];
n = numel(delta);
before = [0, cumsum(delta(1:end - 1))];
neg = delta < 0;
base = before;
base(neg) = before(neg) + delta(neg);
inc = NaN(1, n);
inc(~neg) = delta(~neg);
dec = NaN(1, n);
dec(neg) = -delta(neg);
c = echarts.chart('bar');
c.labels(steps);
c.option('tooltip.trigger', 'axis');
c.option('legend.data', {'increase', 'decrease'});
c.addSeries(base, 'name', 'base', 'stack', 'w', 'silent', true, ...
  'itemStyle', struct('color', 'transparent'));
c.addSeries(inc, 'name', 'increase', 'stack', 'w', ...
  'itemStyle', struct('color', '#59a14f'));
c.addSeries(dec, 'name', 'decrease', 'stack', 'w', ...
  'itemStyle', struct('color', '#e15759'));
c.title('Cash flow');
c.show();
%=============================================================================
