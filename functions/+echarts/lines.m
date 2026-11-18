%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.lines(polylines)
% c = echarts.lines(X, Y)
% c = echarts.lines(..., 'Title', '...')
%   Create a lines chart: one or more polylines drawn on a cartesian plane with
%   an animated trail. 'polylines' is a cell array where each element is an
%   n-by-2 matrix of [x y] vertices; alternatively X and Y are matrices with one
%   polyline per column.
%
%   Example:
%     t = linspace(0, 2*pi, 100).';
%     echarts.lines({[cos(t) sin(t)], [2*cos(t) 2*sin(t)]}).title('Orbits').show();
function c = lines(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  if numel(pos) == 1 && iscell(pos{1})
    polys = pos{1};
  elseif numel(pos) == 2
    X = double(pos{1});
    Y = double(pos{2});
    polys = cell(1, size(X, 2));
    for j = 1:size(X, 2)
      polys{j} = [X(:, j), Y(:, j)];
    end
  else
    error('echarts:lines', 'Expected a cell of polylines, or X and Y matrices.');
  end
  data = cell(numel(polys), 1);
  xmin = Inf; xmax = -Inf; ymin = Inf; ymax = -Inf;
  for k = 1:numel(polys)
    px = double(polys{k}(:, 1));
    py = double(polys{k}(:, 2));
    data{k} = struct('coords', {points2d(px, py)});
    xmin = min(xmin, min(px)); xmax = max(xmax, max(px));
    ymin = min(ymin, min(py)); ymax = max(ymax, max(py));
  end
  % A lines series does not drive the axis extent, so fix it to the data bounds
  % (with a small margin) or the polylines would be clipped.
  mx = 0.05 * (xmax - xmin) + eps;
  my = 0.05 * (ymax - ymin) + eps;
  c = echarts.chart('lines');
  c.option('xAxis', struct('type', 'value', 'min', xmin - mx, 'max', xmax + mx));
  c.option('yAxis', struct('type', 'value', 'min', ymin - my, 'max', ymax + my));
  c.option('legend.show', false);
  c.addSeries(data, 'coordinateSystem', 'cartesian2d', ...
    'polyline', true, 'lineStyle', struct('width', 2, 'opacity', 0.8), ...
    'effect', struct('show', true, 'trailLength', 0.4, 'symbolSize', 5));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
