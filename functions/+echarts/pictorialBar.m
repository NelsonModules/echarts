%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.pictorialBar(labels, values)
% c = echarts.pictorialBar(..., 'Symbol', S, 'Title', '...')
%   Create a pictorial bar chart: each bar is drawn as a repeated symbol. 'S' is
%   an ECharts symbol name ('circle','rect','roundRect','triangle','diamond',
%   'pin','arrow') or a 'path://...' SVG path; it defaults to 'circle'.
%
%   Example:
%     echarts.pictorialBar({'A','B','C'}, [5 8 3], 'Symbol', 'circle').show();
function c = pictorialBar(labels, values, varargin)
  symbol = 'circle';
  o = struct('Names', {{}}, 'Title', '');
  rest = {};
  for k = 1:2:numel(varargin)
    switch lower(char(varargin{k}))
      case 'symbol'
        symbol = char(varargin{k + 1});
      otherwise
        rest = [rest, varargin(k:k + 1)]; %#ok<AGROW>
    end
  end
  o2 = factoryopts(rest);
  o.Names = o2.Names;
  o.Title = o2.Title;
  c = echarts.chart('pictorialBar');
  c.labels(labels);
  c.option('legend.show', false);
  c.addSeries(double(values(:)).', 'name', seriesname(o.Names, 1), ...
    'symbol', symbol, 'symbolRepeat', true, 'symbolSize', {12, 12}, ...
    'symbolClip', true);
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
