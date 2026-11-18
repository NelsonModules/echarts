%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.boxplot(M)
% c = echarts.boxplot(labels, groups)
% c = echarts.boxplot(..., 'Title', '...')
%   Create a box-and-whisker plot. The data is a matrix (one box per column) or
%   a cell array of vectors (one box per vector, lengths may differ). Each box
%   shows the minimum, lower quartile, median, upper quartile and maximum.
%
%   Example:
%     echarts.boxplot(randn(100, 4), 'Title', 'Distributions').show();
function c = boxplot(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  switch numel(pos)
    case 1
      labels = [];
      groups = asGroups(pos{1});
    case 2
      labels = pos{1};
      groups = asGroups(pos{2});
    otherwise
      error('echarts:boxplot', 'Expected the data, or labels and data.');
  end
  n = numel(groups);
  boxes = cell(n, 1);
  for k = 1:n
    boxes{k} = fivenum(groups{k});
  end
  c = echarts.chart('boxplot');
  c.labels(defaultlabels(labels, n));
  c.option('legend.show', false);
  c.addSeries(boxes, 'name', seriesname(o.Names, 1));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
function groups = asGroups(data)
  if iscell(data)
    groups = data(:).';
    return
  end
  if isvector(data)
    groups = {double(data(:)).'};
    return
  end
  groups = cell(1, size(data, 2));
  for j = 1:size(data, 2)
    groups{j} = double(data(:, j)).';
  end
end
%=============================================================================
function s = fivenum(v)
  v = sort(double(v(:)));
  s = [v(1), quantileLin(v, 0.25), quantileLin(v, 0.5), ...
    quantileLin(v, 0.75), v(end)];
end
%=============================================================================
function q = quantileLin(sorted, p)
  % Linear interpolation of order statistics (as in the common type-7 rule).
  n = numel(sorted);
  if n == 1
    q = sorted(1);
    return
  end
  h = (n - 1) * p + 1;
  lo = floor(h);
  frac = h - lo;
  hi = min(lo + 1, n);
  q = sorted(lo) + frac * (sorted(hi) - sorted(lo));
end
%=============================================================================
