%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Radial tree layout.
leaf = @(n) struct('name', n);
branch = @(n, kids) struct('name', n, 'children', {kids});
root = branch('root', { ...
  branch('A', {leaf('a1'), leaf('a2'), leaf('a3')}), ...
  branch('B', {leaf('b1'), branch('b2', {leaf('x'), leaf('y')})}), ...
  branch('C', {leaf('c1'), leaf('c2')})});
c = echarts.tree(root);
c.title('Radial tree');
c.Option.series{1}.layout = 'radial';
c.Option.series{1}.symbolSize = 8;
c.show();
%=============================================================================
