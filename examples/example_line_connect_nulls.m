%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Missing data (NaN) is drawn as a gap; connectNulls bridges it on the second
% series.
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
y1 = [120 132 NaN 134 90 NaN 210];
y2 = [220 182 191 NaN 290 330 310];
c = echarts.line(days, [y1.', y2.'], 'Names', {'Gaps', 'Bridged'});
c.title('Missing data');
c.Option.series{2}.connectNulls = true;
c.show();
%=============================================================================
