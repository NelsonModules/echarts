%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.scatter(x, y)
% c = echarts.scatter(x, Y)
% c = echarts.scatter(..., 'Names', {...}, 'Title', '...')
%   Create a scatter chart over a numeric x axis. Y is a vector (one series) or
%   a matrix (one series per column, all sharing x).
%
%   Example:
%     x = randn(1, 200); y = x + 0.5 * randn(1, 200);
%     echarts.scatter(x, y).title('Correlation').show();
function c = scatter(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  if numel(pos) ~= 2
    error('echarts:scatter', 'Expected x and y.');
  end
  x = pos{1};
  Y = pos{2};
  if isvector(Y)
    Y = Y(:);
  end
  c = echarts.chart('scatter');
  for j = 1:size(Y, 2)
    c.addSeries(points2d(x, Y(:, j)), 'name', seriesname(o.Names, j));
  end
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
