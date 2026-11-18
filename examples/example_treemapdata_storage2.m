%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Treemap: storage breakdown.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {br('Media', {lv('Photos', 120), lv('Video', 240)}), br('Apps', {lv('Games', 80), lv('Tools', 35)}), lv('System', 50)};
echarts.treemap(data).title('Storage breakdown').show();
%=============================================================================
