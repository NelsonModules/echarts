%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Treemap: cloud cost.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {lv('Compute', 480), lv('Storage', 220), lv('Network', 140), lv('DB', 260), lv('Other', 90)};
echarts.treemap(data).title('Cloud cost').show();
%=============================================================================
