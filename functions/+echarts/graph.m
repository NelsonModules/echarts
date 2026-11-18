%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.graph(names, edges)
% c = echarts.graph(names, edges, 'Title', '...')
%   Create a force-directed network graph. 'names' is a cell array of node
%   names; 'edges' is an m-by-2 matrix of 1-based node index pairs, or m-by-3
%   with an edge weight in the third column. The graph can be dragged and
%   zoomed (roam).
%
%   Example:
%     names = {'A','B','C','D'};
%     edges = [1 2; 1 3; 2 4; 3 4];
%     echarts.graph(names, edges).title('Network').show();
function c = graph(names, edges, varargin)
  o = factoryopts(varargin);
  names = ascellstr(names);
  edges = double(edges);
  nodes = cell(numel(names), 1);
  for k = 1:numel(names)
    nodes{k} = struct('name', names{k}, 'symbolSize', 28);
  end
  links = cell(size(edges, 1), 1);
  for k = 1:size(edges, 1)
    s = names{edges(k, 1)};
    t = names{edges(k, 2)};
    if size(edges, 2) >= 3
      links{k} = struct('source', s, 'target', t, 'value', edges(k, 3));
    else
      links{k} = struct('source', s, 'target', t);
    end
  end
  c = echarts.chart('graph');
  c.option('legend.show', false);
  c.option('tooltip.trigger', 'item');
  c.addSeries(nodes, 'links', links, 'layout', 'force', 'roam', true, ...
    'label', struct('show', true), 'force', struct('repulsion', 120, ...
    'edgeLength', 80), 'emphasis', struct('focus', 'adjacency'));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
