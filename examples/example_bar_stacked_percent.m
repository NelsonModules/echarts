%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% 100% stacked bar chart: each category normalized to its total.
q = {'Q1', 'Q2', 'Q3', 'Q4'};
raw = [30 44 25 40; 22 18 33 27; 15 20 12 24];
totals = sum(raw, 1);
pct = 100 * raw ./ totals;
c = echarts.bar(q, pct.', 'Names', {'Alpha', 'Beta', 'Gamma'});
c.title('Share by quarter');
c.stack();
c.option('yAxis.max', 100);
c.option('yAxis.axisLabel', struct('formatter', '{value}%'));
c.dataLabels('inside');
c.Option.series{1}.label.formatter = echarts.fn('(p) => p.value.toFixed(0) + "%"');
c.Option.series{2}.label.formatter = echarts.fn('(p) => p.value.toFixed(0) + "%"');
c.Option.series{3}.label.formatter = echarts.fn('(p) => p.value.toFixed(0) + "%"');
c.show();
%=============================================================================
