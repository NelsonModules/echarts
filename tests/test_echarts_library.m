%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% fromOption() builds a chart from a complete option.
opt = struct();
opt.xAxis = struct('type', 'category', 'data', {{'a', 'b', 'c'}});
opt.yAxis = struct('type', 'value');
opt.series = {struct('type', 'line', 'data', [1 3 2])};
c = echarts.fromOption(opt);
assert_isequal(class(c), 'echarts.chart');
assert_isequal(c.Type, 'line');
assert_isequal(c.config().series{1}.data, [1 3 2]);
%=============================================================================
% fromOption() also accepts a struct array of series.
opt2 = struct();
opt2.series = struct('type', {'bar', 'bar'}, 'data', {[1 2], [3 4]});
c = echarts.fromOption(opt2);
assert_isequal(numel(c.config().series), 2);
assert_isequal(c.config().series{2}.data, [3 4]);
%=============================================================================
% palette() returns n cycled colors.
p = echarts.palette(3);
assert_isequal(numel(p), 3);
p = echarts.palette(12, 'vintage');
assert_isequal(numel(p), 12);
assert_isequal(p{1}, p{11});
%=============================================================================
% colormap() returns a cell array of hex stops.
stops = echarts.colormap('viridis');
assert_istrue(iscell(stops) && numel(stops) >= 2);
assert_isequal(stops{1}(1), '#');
%=============================================================================
% choropleth and wordcloud opt into their bundled libraries.
c = echarts.choropleth({'France'}, 10);
assert_istrue(any(strcmp(c.Library, 'worldmap')));
c = echarts.wordcloud({'a', 'b'}, [2 1]);
assert_istrue(any(strcmp(c.Library, 'wordcloud')));
%=============================================================================
% The 3D charts opt into the echarts-gl extension and carry a 3D grid.
c = echarts.surface(magic(4));
assert_istrue(any(strcmp(c.Library, 'gl')));
assert_istrue(isfield(c.config(), 'grid3D'));
assert_istrue(isfield(c.config(), 'zAxis3D'));
%=============================================================================
