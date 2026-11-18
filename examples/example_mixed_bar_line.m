%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A combination chart: monthly rainfall as bars with a temperature line on a
% second y-axis.
months = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'};
rain = [26 59 90 26 28 70];
temp = [4 6 11 16 21 25];
c = echarts.bar(months, rain, 'Names', {'Rainfall'});
c.addSeries(temp, 'type', 'line', 'name', 'Temperature', 'smooth', true);
c.yaxis2('deg C');
c.title('Climate');
c.show();
%=============================================================================
