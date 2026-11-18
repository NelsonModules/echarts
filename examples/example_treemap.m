%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A treemap of disk usage: rectangle area is proportional to size.
leaf = @(n, v) struct('name', n, 'value', v);
branch = @(n, kids) struct('name', n, 'children', {kids});
data = { ...
  branch('src', {leaf('engine', 120), leaf('graphics', 80), leaf('io', 45)}), ...
  branch('docs', {leaf('help', 30), leaf('examples', 18)}), ...
  leaf('tests', 60)};
echarts.treemap(data).title('Disk usage (MB)').show();
%=============================================================================
