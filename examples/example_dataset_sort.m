%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A dataset transform: one source table sorted by value, then drawn as a bar
% chart (ECharts dataset / transform).
source = { ...
  {'product', 'sales'}, ...
  {'A', 30}, {'B', 45}, {'C', 25}, {'D', 61}, {'E', 38}};
opt = struct();
opt.title = struct('text', 'Sales (sorted)', 'left', 'center');
opt.dataset = {struct('source', {source}), ...
  struct('transform', struct('type', 'sort', ...
    'config', struct('dimension', 'sales', 'order', 'desc')))};
opt.xAxis = struct('type', 'category', 'axisLabel', struct('interval', 0));
opt.yAxis = struct();
opt.series = {struct('type', 'bar', 'datasetIndex', 1, ...
  'encode', struct('x', 'product', 'y', 'sales'))};
opt.grid = struct('top', 50, 'containLabel', true);
echarts.fromOption(opt).show();
%=============================================================================
