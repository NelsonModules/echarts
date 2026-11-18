%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.plot(y)
% c = echarts.plot(x, Y)
% c = echarts.plot(..., 'Names', {...}, 'Title', '...')
%   Line plot over a numeric x axis (unlike echarts.line, which uses category
%   labels). Y is a vector or a matrix of columns sharing x.
%
%   Example:
%     x = linspace(0, 2*pi, 100);
%     echarts.plot(x, [sin(x).', cos(x).'], 'Names', {'sin','cos'}).show();
function c = plot(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  if numel(pos) == 1
    Y = pos{1};
    if isvector(Y)
      Y = Y(:);
    end
    x = 1:size(Y, 1);
  else
    x = pos{1};
    Y = pos{2};
    if isvector(Y)
      Y = Y(:);
    end
  end
  c = echarts.chart('line');
  c.option('xAxis.type', 'value');
  for j = 1:size(Y, 2)
    c.addSeries(points2d(x, Y(:, j)), 'name', seriesname(o.Names, j), ...
      'symbol', 'none', 'smooth', true);
  end
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
