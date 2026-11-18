%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% colors = colorset(n)
% colors = colorset(n, name)
%   Return a column cell array of n hex colors from a named categorical palette
%   ('echarts' default, 'tableau', 'pastel', 'set2', 'dark2', 'bright', 'vintage',
%   'roma'), cycled when n exceeds the palette length.
function colors = colorset(n, name)
  if nargin < 2 || isempty(name)
    name = 'echarts';
  end
  base = paletteStops(lower(char(name)));
  m = numel(base);
  colors = cell(n, 1);
  for k = 1:n
    colors{k} = base{mod(k - 1, m) + 1};
  end
end
%=============================================================================
function s = paletteStops(name)
  switch name
    case 'pastel'
      s = {'#8dd3c7', '#ffffb3', '#bebada', '#fb8072', '#80b1d3', ...
           '#fdb462', '#b3de69', '#fccde5', '#d9d9d9', '#bc80bd'};
    case 'set2'
      s = {'#66c2a5', '#fc8d62', '#8da0cb', '#e78ac3', '#a6d854', ...
           '#ffd92f', '#e5c494', '#b3b3b3'};
    case 'dark2'
      s = {'#1b9e77', '#d95f02', '#7570b3', '#e7298a', '#66a61e', ...
           '#e6ab02', '#a6761d', '#666666'};
    case 'bright'
      s = {'#4269d0', '#efb118', '#ff725c', '#6cc5b0', '#3ca951', ...
           '#ff8ab7', '#a463f2', '#97bbf5', '#9c6b4e', '#9498a0'};
    case 'tableau'
      s = {'#4e79a7', '#f28e2b', '#e15759', '#76b7b2', '#59a14f', ...
           '#edc948', '#b07aa1', '#ff9da7', '#9c755f', '#bab0ac'};
    case 'vintage'
      s = {'#d87c7c', '#919e8b', '#d7ab82', '#6e7074', '#61a0a8', ...
           '#efa18d', '#787464', '#cc7e63', '#724e58', '#4b565b'};
    case 'roma'
      s = {'#e01f54', '#001852', '#f5e8c8', '#b8d2c7', '#c6b38e', ...
           '#a4d8c2', '#f3d999', '#d3758f', '#dcc392', '#2e4783'};
    otherwise
      % ECharts default categorical palette (version 5).
      s = {'#5470c6', '#91cc75', '#fac858', '#ee6666', '#73c0de', ...
           '#3ba272', '#fc8452', '#9a60b4', '#ea7ccc'};
  end
end
%=============================================================================
