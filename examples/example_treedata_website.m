%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Tree: site map.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
root = br('Home', {br('Products', {leaf('A'), leaf('B'), leaf('C')}), br('Blog', {leaf('2023'), leaf('2024')}), leaf('Contact')});
echarts.tree(root).title('Site map').show();
%=============================================================================
