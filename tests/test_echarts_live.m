%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% append() grows the category axis and every series by one value.
c = echarts.chart('line');
c.labels({'a', 'b'});
c.addSeries([1 2], 'name', 'x');
c.addSeries([3 4], 'name', 'y');
c.append('c', [5 6]);
cfg = c.config();
assert_isequal(cfg.xAxis.data, {'a', 'b', 'c'});
assert_isequal(cfg.series{1}.data, [1 2 5]);
assert_isequal(cfg.series{2}.data, [3 4 6]);
%=============================================================================
% MaxPoints keeps a sliding window across the axis and every series.
c = echarts.chart('line');
c.labels({'a', 'b'});
c.addSeries([1 2], 'name', 'x');
c.addSeries([3 4], 'name', 'y');
c.MaxPoints = 3;
c.append('c', [5 6]);
c.append('d', [7 8]);
cfg = c.config();
assert_isequal(cfg.xAxis.data, {'b', 'c', 'd'});
assert_isequal(cfg.series{1}.data, [2 5 7]);
assert_isequal(cfg.series{2}.data, [4 6 8]);
%=============================================================================
% A scalar append broadcasts to every series.
c = echarts.chart('bar');
c.labels({'a'});
c.addSeries(1, 'name', 'x');
c.addSeries(2, 'name', 'y');
c.append('b', 9);
cfg = c.config();
assert_isequal(cfg.series{1}.data, [1 9]);
assert_isequal(cfg.series{2}.data, [2 9]);
%=============================================================================
% push() appends to the first series only.
c = echarts.line({'a'}, 1);
c.push(9);
c.push(4);
assert_isequal(c.config().series{1}.data, [1 9 4]);
%=============================================================================
% append() on a horizontal bar chart grows the y (category) axis.
c = echarts.bar({'a', 'b'}, [1 2]).horizontal();
c.append('c', 5);
assert_isequal(c.config().yAxis.data, {'a', 'b', 'c'});
assert_isequal(c.config().series{1}.data, [1 2 5]);
%=============================================================================
