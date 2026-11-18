%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bar chart with positive and negative values (profit and loss per month).
months = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'};
pnl = [120 -45 80 -30 65 -20 95 40];
c = echarts.bar(months, pnl, 'Names', {'P&L'});
c.title('Profit and loss');
c.option('legend.show', false);
c.dataLabels('inside');
c.show();
%=============================================================================
