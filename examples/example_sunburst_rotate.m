%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-level sunburst with tangentially rotated labels.
leaf = @(n, v) struct('name', n, 'value', v);
branch = @(n, kids) struct('name', n, 'children', {kids});
data = { ...
  branch('Drinks', { ...
    branch('Hot', {leaf('Coffee', 10), leaf('Tea', 8), leaf('Cocoa', 4)}), ...
    branch('Cold', {leaf('Soda', 7), leaf('Juice', 6)})}), ...
  branch('Food', { ...
    branch('Savory', {leaf('Pizza', 9), leaf('Salad', 5)}), ...
    branch('Sweet', {leaf('Cake', 6), leaf('Fruit', 3)})})};
c = echarts.sunburst(data);
c.title('Menu breakdown');
c.Option.series{1}.label = struct('rotate', 'tangential');
c.show();
%=============================================================================
