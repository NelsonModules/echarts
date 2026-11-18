%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% An effect-scatter chart: a few highlighted points pulse with a ripple.
x = [10 20 30 40 50];
y = [8 24 15 32 20];
echarts.effectScatter(x, y) ...
  .title('Hotspots') ...
  .show();
%=============================================================================
