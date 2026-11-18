%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.radar(axes, M)
% c = echarts.radar(..., 'Names', {...}, 'Title', '...')
%   Create a radar (spider) chart. 'axes' is a cell array of indicator names;
%   M is a matrix with one row per series and one column per indicator (a plain
%   vector is a single series). Each indicator axis is scaled to the data.
%
%   Example:
%     echarts.radar({'Speed','Power','Range','Cost','Safety'}, ...
%       [80 90 70 60 85; 70 60 90 80 75], 'Names', {'A','B'}).show();
function c = radar(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  if numel(pos) ~= 2
    error('echarts:radar', 'Expected the indicator names and the data matrix.');
  end
  names = ascellstr(pos{1});
  M = pos{2};
  if isvector(M)
    M = M(:).';
  end
  k = numel(names);
  if size(M, 2) ~= k
    error('echarts:radar', 'The data must have one column per indicator.');
  end
  % Each indicator axis spans 0 to a rounded maximum of its column.
  maxima = max(M, [], 1);
  indicator = cell(k, 1);
  for j = 1:k
    indicator{j} = struct('name', names{j}, 'max', niceMax(maxima(j)));
  end
  data = cell(size(M, 1), 1);
  for i = 1:size(M, 1)
    data{i} = struct('value', M(i, :), 'name', seriesname(o.Names, i));
  end
  c = echarts.chart('radar');
  c.option('radar.indicator', indicator);
  c.addSeries(data);
  c.option('tooltip.trigger', 'item');
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
function m = niceMax(v)
  if v <= 0
    m = 1;
    return
  end
  p = 10 ^ floor(log10(v));
  m = ceil(v / p) * p;
end
%=============================================================================
