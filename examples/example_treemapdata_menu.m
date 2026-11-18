%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Treemap: menu sales.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {br('Mains', {lv('Pizza', 90), lv('Pasta', 70), lv('Salad', 40)}), br('Drinks', {lv('Soda', 50), lv('Coffee', 60)}), lv('Dessert', 45)};
echarts.treemap(data).title('Menu sales').show();
%=============================================================================
