%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A heatmap of activity by day and hour, colored with a named colormap.
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
hours = {'6a', '9a', '12p', '3p', '6p', '9p'};
M = round(40 * rand(numel(hours), numel(days)));
c = echarts.heatmap(days, hours, M);
c.title('Weekly activity');
c.visualMap(min(M(:)), max(M(:)), 'inRange', ...
  struct('color', {echarts.colormap('turbo')}));
c.show();
%=============================================================================
