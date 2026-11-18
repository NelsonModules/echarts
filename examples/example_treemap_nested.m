%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A deeper treemap with drill-down (click a parent to zoom in).
leaf = @(n, v) struct('name', n, 'value', v);
branch = @(n, kids) struct('name', n, 'children', {kids});
data = { ...
  branch('Frontend', { ...
    branch('src', {leaf('components', 120), leaf('pages', 80), leaf('utils', 35)}), ...
    branch('assets', {leaf('img', 60), leaf('css', 25)})}), ...
  branch('Backend', { ...
    branch('api', {leaf('routes', 90), leaf('models', 70)}), ...
    leaf('db', 55)}), ...
  leaf('docs', 40)};
c = echarts.treemap(data);
c.title('Codebase size');
c.Option.series{1}.leafDepth = 1;
c.show();
%=============================================================================
