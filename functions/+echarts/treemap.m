%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.treemap(data)
% c = echarts.treemap(data, 'Title', '...')
%   Create a treemap from a cell array of nested nodes. Each node is a struct
%   with 'name' and either 'value' (a leaf) or 'children' (a cell array of
%   nodes). Rectangle area is proportional to value.
%
%   Example:
%     n = {struct('name','A','value',10), struct('name','B','value',6)};
%     echarts.treemap(n).show();
function c = treemap(data, varargin)
  o = factoryopts(varargin);
  if ~iscell(data)
    data = {data};
  end
  c = echarts.chart('treemap');
  c.option('legend.show', false);
  c.option('tooltip.trigger', 'item');
  c.addSeries(data, 'roam', false, 'label', struct('show', true), ...
    'upperLabel', struct('show', true, 'height', 24), ...
    'levels', {struct('itemStyle', struct('borderColor', '#fff', ...
    'borderWidth', 2, 'gapWidth', 2))});
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
