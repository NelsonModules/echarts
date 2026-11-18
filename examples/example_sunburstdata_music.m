%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Sunburst: music genres.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {br('Rock', {lv('Classic', 6), lv('Indie', 4)}), br('Electronic', {lv('House', 5), lv('Techno', 3)}), br('Jazz', {lv('Bebop', 2)})};
echarts.sunburst(data).title('Music genres').show();
%=============================================================================
