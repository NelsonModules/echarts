%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% colors = echarts.palette(n)
% colors = echarts.palette(n, name)
%   Return a cell array of n hex colors from a named categorical palette, cycled
%   when n exceeds the palette length. Named palettes: 'echarts' (default),
%   'tableau', 'pastel', 'set2', 'dark2', 'bright', 'vintage', 'roma'.
%
%   Example:
%     c = echarts.bar({'a','b','c'}, [1 2 3]);
%     c.colors(echarts.palette(3, 'vintage'));
function colors = palette(n, name)
  if nargin < 2
    name = 'echarts';
  end
  colors = colorset(n, name).';
end
%=============================================================================
