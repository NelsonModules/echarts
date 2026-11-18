%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Three Gaussian clouds of points in 3D (uses the bundled echarts-gl extension).
C = [0 0 0; 5 5 2; -4 3 6];
x = []; y = []; z = [];
for g = 1:3
  x = [x, C(g, 1) + randn(1, 120)]; %#ok<AGROW>
  y = [y, C(g, 2) + randn(1, 120)]; %#ok<AGROW>
  z = [z, C(g, 3) + randn(1, 120)]; %#ok<AGROW>
end
echarts.scatter3D(x, y, z).title('3D clusters').show();
%=============================================================================
