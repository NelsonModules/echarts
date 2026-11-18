%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Treemap: sales regions.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
data = {br('EMEA', {lv('UK', 50), lv('DE', 45), lv('FR', 40)}), br('APAC', {lv('JP', 35), lv('CN', 60)}), br('AMER', {lv('US', 80), lv('BR', 25)})};
echarts.treemap(data).title('Sales regions').show();
%=============================================================================
