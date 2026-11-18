%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Top-to-bottom (vertical) tree layout.
leaf = @(n) struct('name', n);
branch = @(n, kids) struct('name', n, 'children', {kids});
root = branch('CEO', { ...
  branch('CTO', {leaf('Dev'), leaf('QA'), leaf('Ops')}), ...
  branch('CFO', {leaf('Payroll'), leaf('Audit')}), ...
  branch('CMO', {leaf('Brand'), leaf('Growth')})});
c = echarts.tree(root);
c.title('Org chart');
s = c.Option.series{1};
s.orient = 'TB';
s.label = struct('position', 'top', 'rotate', 0, 'verticalAlign', 'middle', ...
  'align', 'right');
s.leaves = struct('label', struct('position', 'bottom', 'rotate', 0, ...
  'verticalAlign', 'middle', 'align', 'left'));
c.Option.series{1} = s;
c.show();
%=============================================================================
