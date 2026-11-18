%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Sunburst: headcount.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {br('Eng', {lv('Backend', 20), lv('Frontend', 15), lv('QA', 8)}), br('GtM', {lv('Sales', 18), lv('Marketing', 10)})};
echarts.sunburst(data).title('Headcount').show();
%=============================================================================
