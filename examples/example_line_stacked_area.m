%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A stacked area chart: several series filled and stacked into one total.
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
Y = [120 132 101 134 90 230 210; ...
     220 182 191 234 290 330 310; ...
     150 232 201 154 190 330 410].';
echarts.area(days, Y, 'Names', {'Email', 'Union Ads', 'Video Ads'}) ...
  .title('Channel traffic') ...
  .stack() ...
  .show();
%=============================================================================
