%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% option() reads and writes nested paths.
c = echarts.bar({'a', 'b'}, [1 2]);
c.option('yAxis.min', 0);
assert_isequal(c.option('yAxis.min'), 0);
assert_isequal(c.config().yAxis.min, 0);
assert_isequal(c.option('does.not.exist'), []);
%=============================================================================
% stack() groups every series.
c = echarts.bar({'a', 'b'}, [1 2; 3 4], 'Names', {'x', 'y'}).stack();
assert_isequal(c.config().series{1}.stack, 'total');
assert_isequal(c.config().series{2}.stack, 'total');
%=============================================================================
% smooth() and area() set the matching series fields.
c = echarts.line({'a', 'b'}, [1 2]).smooth(true).area(true);
assert_istrue(c.config().series{1}.smooth);
assert_istrue(isfield(c.config().series{1}, 'areaStyle'));
c.area(false);
assert_isfalse(isfield(c.config().series{1}, 'areaStyle'));
%=============================================================================
% horizontal() puts the category axis on y.
c = echarts.bar({'a', 'b'}, [1 2]).horizontal();
assert_isequal(c.config().yAxis.type, 'category');
assert_isequal(c.config().xAxis.type, 'value');
%=============================================================================
% logscale() and yaxis2().
c = echarts.line({'a', 'b'}, [1 2]);
c.logscale('y');
assert_isequal(c.config().yAxis.type, 'log');
c = echarts.line({'a', 'b'}, [1 2]);
c.addSeries([10 20], 'name', 'big');
c.yaxis2('right');
cfg = c.config();
assert_isequal(numel(cfg.yAxis), 2);
assert_isequal(cfg.series{2}.yAxisIndex, 1);
%=============================================================================
% dataLabels() toggles the series label.
c = echarts.bar({'a', 'b'}, [1 2]).dataLabels('top');
assert_istrue(c.config().series{1}.label.show);
assert_isequal(c.config().series{1}.label.position, 'top');
%=============================================================================
% colors() sets the top-level palette.
c = echarts.bar({'a', 'b'}, [1 2]).colors({'#111111', '#222222'});
assert_isequal(c.config().color, {'#111111', '#222222'});
%=============================================================================
% dataZoom() and toolbox() add their components.
c = echarts.line(1:5, 1:5).dataZoom('x').toolbox();
assert_istrue(numel(c.config().dataZoom) >= 1);
assert_istrue(isfield(c.config().toolbox, 'feature'));
%=============================================================================
