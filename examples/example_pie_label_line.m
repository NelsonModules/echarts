%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Pie chart with outside labels joined by label lines showing the percentage.
c = echarts.pie({'Search', 'Direct', 'Email', 'Union Ads', 'Video Ads'}, ...
  [1048 735 580 484 300]);
c.title('Referrals');
c.Option.series{1}.label = struct('show', true, 'formatter', '{b}: {d}%');
c.Option.series{1}.labelLine = struct('show', true, 'length', 14, 'length2', 12);
c.show();
%=============================================================================
