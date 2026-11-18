%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.choropleth(countries, values)
% c = echarts.choropleth(..., 'Title', '...')
%   Create a world choropleth map: each country is shaded by its value. The
%   bundled world map is loaded automatically. 'countries' is a cell array of
%   English country names as used by the map (for example 'France', 'United
%   States of America', 'China'); 'values' is the matching data.
%
%   Example:
%     echarts.choropleth({'France','China','Brazil'}, [10 40 25]).show();
function c = choropleth(countries, values, varargin)
  o = factoryopts(varargin);
  names = ascellstr(countries);
  values = double(values(:));
  n = numel(names);
  if numel(values) ~= n
    error('echarts:choropleth', 'countries and values must be the same length.');
  end
  data = cell(n, 1);
  for k = 1:n
    data{k} = struct('name', names{k}, 'value', values(k));
  end
  c = echarts.chart('map');
  c.Library = {'auto', 'worldmap'};
  c.option('legend.show', false);
  c.option('tooltip.trigger', 'item');
  c.addSeries(data, 'map', 'world', 'roam', true, ...
    'emphasis', struct('label', struct('show', true)));
  c.visualMap(min(values), max(values), 'inRange', ...
    struct('color', {{'#e0f3f8', '#abd9e9', '#74add1', '#4575b4', '#313695'}}), ...
    'left', 20, 'bottom', 20);
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
