%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Sunburst: expense sunburst.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {br('Fixed', {lv('Rent', 1200), lv('Utilities', 200)}), br('Variable', {lv('Food', 500), lv('Fun', 300)})};
echarts.sunburst(data).title('Expense sunburst').show();
%=============================================================================
