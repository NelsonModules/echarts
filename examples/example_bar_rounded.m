%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bars with rounded tops (itemStyle borderRadius).
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
c = echarts.bar(days, [120 200 150 80 70 110 130], 'Names', {'Visits'});
c.title('Rounded bars');
c.option('legend.show', false);
c.Option.series{1}.itemStyle = struct('borderRadius', {{8, 8, 0, 0}});
c.show();
%=============================================================================
