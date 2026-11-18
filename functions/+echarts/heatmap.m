%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.heatmap(M)
% c = echarts.heatmap(xlabels, ylabels, M)
% c = echarts.heatmap(..., 'Title', '...')
%   Create a heatmap of the matrix M, one cell per entry, colored by value with
%   a continuous visual map. 'xlabels' name the columns and 'ylabels' the rows;
%   when omitted they are numbered. M(i, j) is the cell at row i, column j.
%
%   Example:
%     echarts.heatmap(magic(6)).title('Magic square').show();
function c = heatmap(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  switch numel(pos)
    case 1
      M = pos{1};
      xlabels = 1:size(M, 2);
      ylabels = 1:size(M, 1);
    case 3
      xlabels = pos{1};
      ylabels = pos{2};
      M = pos{3};
    otherwise
      error('echarts:heatmap', 'Expected M, or xlabels, ylabels and M.');
  end
  M = double(M);
  [nr, nc] = size(M);
  % ECharts heatmap cells are [columnIndex, rowIndex, value] with 0-based axes.
  data = cell(nr * nc, 1);
  t = 0;
  for i = 1:nr
    for j = 1:nc
      t = t + 1;
      data{t} = [j - 1, i - 1, M(i, j)];
    end
  end
  c = echarts.chart('heatmap');
  c.labels(xlabels);
  c.option('yAxis.data', asCat(ylabels));
  c.option('legend.show', false);
  c.addSeries(data, 'label', struct('show', nr * nc <= 144));
  c.visualMap(min(M(:)), max(M(:)), 'inRange', ...
    struct('color', {{'#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', ...
      '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026'}}));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
function v = asCat(labels)
  if isnumeric(labels)
    v = ascellstr(labels);
  elseif isstring(labels)
    v = cellstr(labels);
    v = v(:).';
  else
    v = labels;
  end
end
%=============================================================================
