%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A styled doughnut with a centered total and name/percent labels.
c = echarts.doughnut({'Direct', 'Email', 'Ads', 'Video', 'Search'}, ...
  [335 310 234 135 1548]);
c.title('Traffic sources');
c.colors('set2');
s = c.Option.series{1};
s.radius = {'45%', '70%'};
s.itemStyle = struct('borderColor', '#fff', 'borderWidth', 2, 'borderRadius', 6);
s.label = struct('show', true, 'formatter', '{b}\n{d}%');
c.Option.series{1} = s;
c.legend('bottom');
c.show();
%=============================================================================
