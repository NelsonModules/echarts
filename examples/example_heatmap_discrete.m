%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Heatmap with a discrete (piecewise) visual map binning values into levels.
M = round(100 * rand(7, 12));
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
cols = cell(1, 12);
for k = 1:12
  cols{k} = sprintf('W%d', k);
end
c = echarts.heatmap(cols, days, M);
c.title('Weekly intensity (binned)');
c.Option.visualMap = struct('type', 'piecewise', 'orient', 'horizontal', ...
  'left', 'center', 'bottom', 8, 'splitNumber', 5, 'min', 0, 'max', 100, ...
  'inRange', struct('color', {echarts.colormap('blues')}));
c.show();
%=============================================================================
