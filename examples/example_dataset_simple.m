%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A dataset-driven bar chart: one data table, several series mapped from its
% columns automatically (ECharts dataset / encode).
source = { ...
  {'product', '2021', '2022', '2023'}, ...
  {'Matcha', 43, 85, 93}, ...
  {'Milk', 83, 73, 55}, ...
  {'Cheese', 86, 65, 82}, ...
  {'Walnut', 72, 53, 39}};
opt = struct();
opt.dataset = struct('source', {source});
opt.xAxis = struct('type', 'category');
opt.yAxis = struct();
opt.tooltip = struct('trigger', 'axis');
opt.legend = struct('show', true, 'top', 8);
opt.series = {struct('type', 'bar'), struct('type', 'bar'), struct('type', 'bar')};
opt.title = struct('text', 'Sales by year', 'left', 'center', 'top', 30);
opt.grid = struct('top', 70, 'containLabel', true);
echarts.fromOption(opt).show();
%=============================================================================
