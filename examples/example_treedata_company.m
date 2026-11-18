%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Tree: company structure.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
root = br('Company', {br('Engineering', {leaf('Backend'), leaf('Frontend'), leaf('Data')}), br('Sales', {leaf('EU'), leaf('US')}), br('HR', {leaf('Recruiting')})});
echarts.tree(root).title('Company structure').show();
%=============================================================================
