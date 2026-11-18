%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.funnel(values)
% c = echarts.funnel(labels, values)
% c = echarts.funnel(..., 'Title', '...')
%   Create a funnel chart, one band per value (for example a conversion funnel).
%   'labels' name the bands; when omitted they are 1..n.
%
%   Example:
%     echarts.funnel({'Visit','Cart','Order','Paid'}, [100 80 60 40]).show();
function c = funnel(varargin)
  [pos, nv] = splitargs(varargin);
  o = factoryopts(nv);
  [labels, values] = resolvelabelsy(pos);
  c = echarts.chart('funnel');
  c.addSeries(pievalues(labels, values), 'name', seriesname(o.Names, 1), ...
    'left', '10%', 'width', '80%', 'label', struct('show', true, ...
    'position', 'inside'));
  c.option('tooltip.trigger', 'item');
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
