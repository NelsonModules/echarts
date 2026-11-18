%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.sunburst(data)
% c = echarts.sunburst(data, 'Title', '...')
%   Create a sunburst chart (a radial treemap) from a cell array of nested
%   nodes. Each node is a struct with 'name' and either 'value' (a leaf) or
%   'children' (a cell array of nodes).
%
%   Example:
%     leaf = @(n, v) struct('name', n, 'value', v);
%     root = {struct('name','A','children',{{leaf('a1',4), leaf('a2',3)}}), ...
%             leaf('B', 5)};
%     echarts.sunburst(root).show();
function c = sunburst(data, varargin)
  o = factoryopts(varargin);
  if ~iscell(data)
    data = {data};
  end
  c = echarts.chart('sunburst');
  c.option('legend.show', false);
  c.option('tooltip.trigger', 'item');
  c.addSeries(data, 'radius', {'0', '92%'}, ...
    'label', struct('rotate', 'radial'), ...
    'emphasis', struct('focus', 'ancestor'));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
