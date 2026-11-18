%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Three colored clusters, each a separate scatter series.
centers = [-2 0; 2 1; 0 3];
c = echarts.chart('scatter');
for g = 1:3
  P = centers(g, :) + 0.6 * randn(60, 2);
  c.addSeries(num2cell(P, 2), 'name', sprintf('Group %d', g), 'symbolSize', 9);
end
c.title('Clusters');
c.show();
%=============================================================================
