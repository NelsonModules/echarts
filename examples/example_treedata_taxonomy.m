%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Tree: animal taxonomy.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
root = br('Animalia', {br('Chordata', {br('Mammalia', {leaf('Cat'), leaf('Dog')}), br('Aves', {leaf('Eagle')})}), br('Arthropoda', {leaf('Ant'), leaf('Bee')})});
echarts.tree(root).title('Animal taxonomy').show();
%=============================================================================
