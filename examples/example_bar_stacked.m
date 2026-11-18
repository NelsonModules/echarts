%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A stacked bar chart comparing three products across four quarters.
q = {'Q1', 'Q2', 'Q3', 'Q4'};
Y = [30 44 25 40; 22 18 33 27; 15 20 12 24].';
echarts.bar(q, Y, 'Names', {'Alpha', 'Beta', 'Gamma'}) ...
  .title('Sales by product') ...
  .stack() ...
  .show();
%=============================================================================
