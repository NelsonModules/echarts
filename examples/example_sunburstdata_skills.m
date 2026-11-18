%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Sunburst: skill wheel.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {br('Technical', {lv('Coding', 8), lv('Testing', 5), lv('DevOps', 4)}), br('Soft', {lv('Comm', 7), lv('Lead', 6)})};
echarts.sunburst(data).title('Skill wheel').show();
%=============================================================================
