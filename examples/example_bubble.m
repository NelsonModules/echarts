%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A bubble chart: each point is sized by a third variable (here, population).
gdp = [1.2 3.4 2.1 5.6 4.2 6.8];
life = [65 72 70 80 76 82];
pop = [120 40 300 60 220 90];
echarts.bubble(gdp, life, pop, 'Title', 'Countries') ...
  .xlabel('GDP') ...
  .ylabel('life expectancy') ...
  .show();
%=============================================================================
