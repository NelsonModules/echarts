%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Treemap: budget treemap.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {lv('Rent', 1200), lv('Food', 600), lv('Transport', 300), lv('Leisure', 250), lv('Savings', 400)};
echarts.treemap(data).title('Budget treemap').show();
%=============================================================================
