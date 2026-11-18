%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.pie(values)
% c = echarts.pie(labels, values)
% c = echarts.pie(..., 'Title', '...')
%   Create a pie chart from a vector of values, one slice per value, with
%   per-slice colors. 'labels' name the slices; when omitted they are 1..n.
%
%   Example:
%     c = echarts.pie({'A','B','C'}, [30 45 25]);
%     c.title('Share');
%     c.show();
function c = pie(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  [labels, values] = resolvelabelsy(pos);
  c = echarts.chart('pie');
  c.addSeries(pievalues(labels, values), 'name', seriesname(o.Names, 1), ...
    'radius', '58%', 'center', {'50%', '55%'});
  c.option('tooltip.trigger', 'item');
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
