%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Treemap: portfolio weights.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {br('Stocks', {lv('US', 40), lv('EU', 25), lv('Asia', 15)}), br('Bonds', {lv('Gov', 12), lv('Corp', 8)}), lv('Cash', 10)};
echarts.treemap(data).title('Portfolio weights').show();
%=============================================================================
