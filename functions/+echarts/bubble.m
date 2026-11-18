%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.bubble(x, y, r)
% c = echarts.bubble(..., 'Title', '...')
%   Create a bubble chart: a scatter plot where each point (x, y) is drawn with
%   a radius taken from r. x, y and r are vectors of the same length.
%
%   Example:
%     echarts.bubble([1 2 3 4], [10 7 13 9], [20 40 15 30]).show();
function c = bubble(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  if numel(pos) ~= 3
    error('echarts:bubble', 'Expected x, y and r.');
  end
  x = double(pos{1}(:));
  y = double(pos{2}(:));
  r = double(pos{3}(:));
  n = numel(x);
  pts = cell(n, 1);
  for k = 1:n
    pts{k} = [x(k), y(k), r(k)];
  end
  c = echarts.chart('scatter');
  % The third value drives the symbol size, scaled to a readable pixel range.
  rmax = max(r);
  if rmax <= 0
    rmax = 1;
  end
  sizeFn = sprintf('(d) => 8 + 42 * Math.sqrt(d[2] / %g)', rmax);
  c.addSeries(pts, 'name', seriesname(o.Names, 1), 'symbolSize', echarts.fn(sizeFn));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
