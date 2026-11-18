%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A tree diagram built from a nested struct (click a node to collapse it).
leaf = @(n) struct('name', n);
branch = @(n, kids) struct('name', n, 'children', {kids});
root = branch('nelson', { ...
  branch('modules', {leaf('core'), leaf('graphics'), leaf('gui')}), ...
  branch('toolboxes', {leaf('chartjs'), leaf('echarts')}), ...
  leaf('docs')});
echarts.tree(root).title('Project tree').show();
%=============================================================================
