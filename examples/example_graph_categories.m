%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A force graph whose nodes are colored by category, with a legend.
names = {'Core', 'IO', 'Parser', 'UI', 'Theme', 'Icons', 'Tests', 'Docs'};
cat = [0 0 0 1 1 1 2 2];       % category per node
edges = [1 2; 1 3; 1 4; 4 5; 4 6; 1 7; 4 7; 3 2; 1 8];
nodes = cell(numel(names), 1);
for k = 1:numel(names)
  nodes{k} = struct('name', names{k}, 'category', cat(k), 'symbolSize', 26);
end
links = cell(size(edges, 1), 1);
for k = 1:size(edges, 1)
  links{k} = struct('source', names{edges(k, 1)}, 'target', names{edges(k, 2)});
end
cats = {struct('name', 'Engine'), struct('name', 'Interface'), struct('name', 'Quality')};
opt = struct();
opt.title = struct('text', 'Modules by area', 'left', 'center');
opt.tooltip = struct();
opt.legend = struct('top', 30);
opt.series = {struct('type', 'graph', 'layout', 'force', 'roam', true, ...
  'label', struct('show', true), 'data', {nodes}, 'links', {links}, ...
  'categories', {cats}, 'force', struct('repulsion', 150, 'edgeLength', 90), ...
  'emphasis', struct('focus', 'adjacency'))};
echarts.fromOption(opt).show();
%=============================================================================
