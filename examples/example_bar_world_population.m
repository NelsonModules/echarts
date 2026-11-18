%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Horizontal grouped bars comparing two years (the ECharts "World Population"
% layout), largest at the top.
countries = {'Brazil', 'Indonesia', 'USA', 'India', 'China'};
y2011 = [18203 23489 29034 104970 131744];
y2012 = [19325 23438 31000 121594 134141];
echarts.bar(countries, [y2011.', y2012.'], 'Names', {'2011', '2012'}) ...
  .horizontal() ...
  .title('World population (10k)') ...
  .legend('top') ...
  .show();
%=============================================================================
