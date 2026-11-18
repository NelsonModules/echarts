%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
assert_isequal(echarts_version(), '1.0.0');
%=============================================================================
c = echarts.bar({'a', 'b', 'c'}, [1 2 3]);
assert_isequal(class(c), 'echarts.chart');
assert_isequal(c.Type, 'bar');
%=============================================================================
cfg = c.config();
assert_isequal(cfg.xAxis.type, 'category');
assert_isequal(cfg.xAxis.data, {'a', 'b', 'c'});
assert_isequal(numel(cfg.series), 1);
assert_isequal(cfg.series{1}.type, 'bar');
assert_isequal(cfg.series{1}.data, [1 2 3]);
%=============================================================================
% Category labels can be numeric and are kept.
c = echarts.line([10 20 30], [4 5 6]);
assert_isequal(c.config().xAxis.data, [10 20 30]);
assert_isequal(c.config().series{1}.type, 'line');
%=============================================================================
% A matrix makes one series per column.
c = echarts.bar({'a', 'b'}, [1 2; 3 4], 'Names', {'x', 'y'});
cfg = c.config();
assert_isequal(numel(cfg.series), 2);
assert_isequal(cfg.series{1}.name, 'x');
assert_isequal(cfg.series{2}.name, 'y');
assert_isequal(cfg.series{1}.data, [1 3]);
%=============================================================================
% Title, labels and legend set the expected option paths.
c = echarts.bar({'a', 'b'}, [1 2]).title('T').xlabel('X').ylabel('Y');
cfg = c.config();
assert_isequal(cfg.title.text, 'T');
assert_isequal(cfg.xAxis.name, 'X');
assert_isequal(cfg.yAxis.name, 'Y');
c.legend('bottom');
assert_isequal(c.config().legend.bottom, 8);
c.legend(false);
assert_isfalse(c.config().legend.show);
%=============================================================================
