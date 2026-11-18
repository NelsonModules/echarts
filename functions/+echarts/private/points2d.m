%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% pts = points2d(x, y)
%   Build an ECharts [[x, y], ...] cell array of points from paired vectors.
function pts = points2d(x, y)
  x = double(x(:));
  y = double(y(:));
  if numel(x) ~= numel(y)
    error('echarts:points', 'x and y must have the same number of elements.');
  end
  n = numel(x);
  pts = cell(n, 1);
  for k = 1:n
    pts{k} = [x(k), y(k)];
  end
end
%=============================================================================
