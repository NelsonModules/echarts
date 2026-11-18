%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Grouped bar chart: several series drawn side by side per category.
q = {'2019', '2020', '2021', '2022', '2023'};
Y = [60 72 85 91 102; ...
     40 55 58 70 88; ...
     30 36 44 52 61].';
echarts.bar(q, Y, 'Names', {'Europe', 'Asia', 'Americas'}) ...
  .title('Revenue by region') ...
  .ylabel('M EUR') ...
  .show();
%=============================================================================
