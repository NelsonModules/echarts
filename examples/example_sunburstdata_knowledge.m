%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Sunburst: knowledge tree.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {br('Math', {lv('Algebra', 5), lv('Calculus', 4)}), br('CS', {lv('Algorithms', 6), lv('Systems', 5)})};
echarts.sunburst(data).title('Knowledge tree').show();
%=============================================================================
