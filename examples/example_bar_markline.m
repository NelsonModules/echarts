%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bar chart with an average reference line (markLine type 'average').
months = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'};
c = echarts.bar(months, [70 90 110 85 130 95 150 120], 'Names', {'Orders'});
c.title('Orders vs average');
c.option('legend.show', false);
c.Option.series{1}.markLine = struct('data', ...
  {{struct('type', 'average', 'name', 'Avg')}}, ...
  'label', struct('formatter', 'avg {c}'));
c.show();
%=============================================================================
