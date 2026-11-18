%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Tree: library sections.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
root = br('Library', {br('Fiction', {leaf('SciFi'), leaf('Fantasy')}), br('Nonfiction', {leaf('History'), leaf('Science')})});
echarts.tree(root).title('Library sections').show();
%=============================================================================
