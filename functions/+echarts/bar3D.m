%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.bar3D(M)
% c = echarts.bar3D(xlabels, ylabels, M)
% c = echarts.bar3D(..., 'Title', '...')
%   Create a 3D bar chart (uses the bundled echarts-gl extension): one bar per
%   matrix entry, its height M(i, j), colored by height. 'xlabels' name the
%   columns and 'ylabels' the rows; when omitted they are numbered.
%
%   Example:
%     echarts.bar3D(magic(6)).title('Magic square').show();
function c = bar3D(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  switch numel(pos)
    case 1
      M = double(pos{1});
      xlabels = 1:size(M, 2);
      ylabels = 1:size(M, 1);
    case 3
      xlabels = pos{1};
      ylabels = pos{2};
      M = double(pos{3});
    otherwise
      error('echarts:bar3D', 'Expected M, or xlabels, ylabels and M.');
  end
  [nr, nc] = size(M);
  data = cell(nr * nc, 1);
  t = 0;
  for i = 1:nr
    for j = 1:nc
      t = t + 1;
      data{t} = [j - 1, i - 1, M(i, j)];
    end
  end
  c = make3d('bar3D');
  c.Option.xAxis3D = struct('type', 'category', 'data', {asCat3d(xlabels)}, 'name', 'x');
  c.Option.yAxis3D = struct('type', 'category', 'data', {asCat3d(ylabels)}, 'name', 'y');
  c.addSeries(data);
  c.visualMap(min(M(:)), max(M(:)), 'dimension', 2, 'inRange', ...
    struct('color', {echarts.colormap('viridis')}), 'left', 10, 'bottom', 10);
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
function v = asCat3d(labels)
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
