%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.parallel(dims, M)
% c = echarts.parallel(..., 'Title', '...')
%   Create a parallel-coordinates plot. 'dims' is a cell array of axis names;
%   M is a matrix with one row per observation and one column per dimension.
%   Each row is drawn as a polyline crossing every axis.
%
%   Example:
%     echarts.parallel({'mpg','hp','weight'}, [30 90 2; 18 160 3.5]).show();
function c = parallel(dims, M, varargin)
  o = factoryopts(varargin);
  names = ascellstr(dims);
  M = double(M);
  k = numel(names);
  if size(M, 2) ~= k
    error('echarts:parallel', 'The data must have one column per dimension.');
  end
  axesSpec = cell(k, 1);
  for j = 1:k
    axesSpec{j} = struct('dim', j - 1, 'name', names{j});
  end
  rows = cell(size(M, 1), 1);
  for i = 1:size(M, 1)
    rows{i} = M(i, :);
  end
  c = echarts.chart('parallel');
  c.option('legend.show', false);
  c.option('parallelAxis', axesSpec);
  c.option('parallel', struct('left', '5%', 'right', '12%', 'top', 60, ...
    'bottom', 40));
  c.addSeries(rows, 'lineStyle', struct('width', 1.5, 'opacity', 0.6));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
