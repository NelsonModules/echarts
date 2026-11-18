%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A sunburst chart (a radial treemap) of a two-level hierarchy.
leaf = @(n, v) struct('name', n, 'value', v);
branch = @(n, kids) struct('name', n, 'children', {kids});
data = { ...
  branch('Grandpa', {branch('Uncle Leo', {leaf('Cousin Jack', 3), leaf('Cousin Mary', 2)}), ...
                     branch('Father', {leaf('Me', 5), leaf('Brother Peter', 1)})}), ...
  branch('Nancy', {branch('Uncle Nike', {leaf('Cousin Betty', 1), leaf('Cousin Jenny', 2)})})};
echarts.sunburst(data).title('Family').show();
%=============================================================================
