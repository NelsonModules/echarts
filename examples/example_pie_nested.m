%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Nested pies: an inner summary ring and an outer detailed ring.
item = @(n, v) struct('name', n, 'value', v);
inner = {item('Direct', 1548), item('Marketing', 775)};
outer = {item('Direct', 1548), item('Email', 335), item('Ads', 310), ...
  item('Video', 234), item('Search', 1048)};
c = echarts.chart('pie');
c.option('tooltip.trigger', 'item');
c.addSeries(inner, 'name', 'Channel', 'radius', {0, '30%'}, ...
  'label', struct('position', 'inner', 'fontSize', 12), ...
  'labelLine', struct('show', false));
c.addSeries(outer, 'name', 'Source', 'radius', {'45%', '62%'}, ...
  'label', struct('formatter', '{b}: {d}%'));
c.title('Nested pie');
c.show();
%=============================================================================
