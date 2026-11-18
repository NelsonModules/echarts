%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.doughnut(values)
% c = echarts.doughnut(labels, values)
% c = echarts.doughnut(..., 'Title', '...')
%   Create a doughnut (ring) chart: a pie chart with a hollow center. 'labels'
%   name the slices; when omitted they are 1..n.
%
%   Example:
%     echarts.doughnut({'A','B','C'}, [30 45 25]).title('Share').show();
function c = doughnut(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  [labels, values] = resolvelabelsy(pos);
  c = echarts.chart('pie');
  c.addSeries(pievalues(labels, values), 'name', seriesname(o.Names, 1), ...
    'radius', {'42%', '62%'}, 'center', {'50%', '55%'}, ...
    'avoidLabelOverlap', true);
  c.option('tooltip.trigger', 'item');
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
