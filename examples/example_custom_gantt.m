%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A custom series (renderItem) drawing a simple Gantt chart: each task is a
% horizontal bar from its start to its end on a numeric time axis.
tasks = {'Design', 'Build', 'Test', 'Ship'};
% rows: [rowIndex, start, end]
data = {[0 0 3], [1 2 7], [2 6 10], [3 9 12]};
renderItem = ['(params, api) => {', ...
  ' var row = api.value(0);', ...
  ' var start = api.coord([api.value(1), row]);', ...
  ' var end = api.coord([api.value(2), row]);', ...
  ' var h = api.size([0, 1])[1] * 0.6;', ...
  ' return { type: "rect",', ...
  '   shape: { x: start[0], y: start[1] - h / 2,', ...
  '            width: end[0] - start[0], height: h, r: 4 },', ...
  '   style: api.style() };', ...
  '}'];
opt = struct();
opt.title = struct('text', 'Project plan', 'left', 'center');
opt.tooltip = struct();
opt.grid = struct('left', 90, 'right', 30, 'top', 50, 'bottom', 30);
opt.xAxis = struct('type', 'value', 'name', 'week');
opt.yAxis = struct('type', 'category', 'data', {tasks}, 'inverse', true);
opt.series = {struct('type', 'custom', 'renderItem', echarts.fn(renderItem), ...
  'encode', struct('x', {{1, 2}}, 'y', 0), 'data', {data})};
echarts.fromOption(opt).show();
%=============================================================================
