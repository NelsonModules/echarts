%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.tree(root)
% c = echarts.tree(root, 'Title', '...')
%   Create a tree diagram from a nested struct. 'root' is a struct with a 'name'
%   field and an optional 'children' field holding a cell array of child structs
%   of the same shape.
%
%   Example:
%     leaf = @(n) struct('name', n);
%     root = struct('name', 'root', 'children', {{leaf('a'), leaf('b')}});
%     echarts.tree(root).show();
function c = tree(root, varargin)
  o = factoryopts(varargin);
  c = echarts.chart('tree');
  c.option('legend.show', false);
  c.option('tooltip.trigger', 'item');
  c.addSeries({root}, 'top', '5%', 'bottom', '5%', 'left', '8%', ...
    'right', '18%', 'symbolSize', 10, 'expandAndCollapse', true, ...
    'label', struct('position', 'left', 'align', 'right'), ...
    'leaves', struct('label', struct('position', 'right', 'align', 'left')));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
