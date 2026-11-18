%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.polar(labels, values)
% c = echarts.polar(..., 'Title', '...')
%   Create a polar bar chart: bars arranged around a circle, one per category.
%   'labels' name the sectors; when omitted they are 1..n.
%
%   Example:
%     echarts.polar({'N','E','S','W'}, [5 8 3 6]).title('Wind').show();
function c = polar(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  [labels, values] = resolvelabelsy(pos);
  values = double(values(:)).';
  cats = defaultlabels(labels, numel(values));
  c = echarts.chart('bar');
  c.Option = rmfield(c.Option, 'xAxis');
  c.Option = rmfield(c.Option, 'yAxis');
  c.Option = rmfield(c.Option, 'grid');
  c.option('polar', struct('radius', {{30, '80%'}}));
  c.option('angleAxis', struct('type', 'category', 'data', {cats}, ...
    'startAngle', 90));
  c.option('radiusAxis', struct());
  c.option('legend.show', false);
  c.addSeries(values, 'coordinateSystem', 'polar', 'name', seriesname(o.Names, 1));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
