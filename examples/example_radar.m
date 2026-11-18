%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A radar chart comparing two budgets across six categories.
axesNames = {'Sales', 'Admin', 'IT', 'Support', 'Dev', 'Marketing'};
data = [4200 3000 20000 35000 50000 18000; ...
        5000 14000 28000 26000 42000 21000];
echarts.radar(axesNames, data, 'Names', {'Allocated', 'Actual'}) ...
  .title('Budget') ...
  .show();
%=============================================================================
