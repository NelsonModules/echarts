%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.hist(x)
% c = echarts.hist(x, nbins)
% c = echarts.hist(..., 'Title', '...')
%   Create a histogram of the data vector x using 'nbins' equal-width bins
%   (default 10). The bars touch, and each category label is the bin center.
%
%   Example:
%     echarts.hist(randn(1, 1000), 20).title('Normal sample').show();
function c = hist(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  x = double(pos{1}(:));
  if numel(pos) >= 2
    nbins = double(pos{2});
  else
    nbins = 10;
  end
  lo = min(x);
  hi = max(x);
  if hi == lo
    hi = lo + 1;
  end
  edges = linspace(lo, hi, nbins + 1);
  counts = zeros(1, nbins);
  for k = 1:nbins
    if k < nbins
      counts(k) = sum(x >= edges(k) & x < edges(k + 1));
    else
      counts(k) = sum(x >= edges(k) & x <= edges(k + 1));
    end
  end
  centers = (edges(1:end - 1) + edges(2:end)) / 2;
  labels = cell(1, nbins);
  for k = 1:nbins
    labels{k} = sprintf('%.2g', centers(k));
  end
  c = echarts.chart('bar');
  c.labels(labels);
  c.option('xAxis.boundaryGap', true);
  c.option('legend.show', false);
  c.addSeries(counts, 'name', seriesname(o.Names, 1), 'barCategoryGap', '0%');
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
