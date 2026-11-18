%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.sankey(sources, targets, values)
% c = echarts.sankey(..., 'Title', '...')
%   Create a Sankey flow diagram from a list of links. 'sources' and 'targets'
%   are cell arrays of node names (one entry per link); 'values' are the flow
%   magnitudes. The node set is the union of all names used.
%
%   Example:
%     s = {'A','A','B','C'}; t = {'B','C','D','D'}; v = [5 3 5 3];
%     echarts.sankey(s, t, v).title('Flow').show();
function c = sankey(sources, targets, values, varargin)
  o = factoryopts(varargin);
  src = ascellstr(sources);
  tgt = ascellstr(targets);
  values = double(values(:));
  m = numel(src);
  if numel(tgt) ~= m || numel(values) ~= m
    error('echarts:sankey', 'sources, targets and values must be the same length.');
  end
  nodeNames = uniqueNames([src, tgt]);
  nodes = cell(numel(nodeNames), 1);
  for k = 1:numel(nodeNames)
    nodes{k} = struct('name', nodeNames{k});
  end
  links = cell(m, 1);
  for k = 1:m
    links{k} = struct('source', src{k}, 'target', tgt{k}, 'value', values(k));
  end
  c = echarts.chart('sankey');
  c.option('legend.show', false);
  c.option('tooltip.trigger', 'item');
  c.addSeries(nodes, 'links', links, 'emphasis', struct('focus', 'adjacency'), ...
    'lineStyle', struct('color', 'gradient', 'curveness', 0.5));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
function names = uniqueNames(all)
  names = {};
  for k = 1:numel(all)
    if ~any(strcmp(names, all{k}))
      names{end + 1} = all{k}; %#ok<AGROW>
    end
  end
end
%=============================================================================
