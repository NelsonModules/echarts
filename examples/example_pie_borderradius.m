%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Doughnut with rounded sectors separated by a white border.
c = echarts.doughnut({'A', 'B', 'C', 'D', 'E'}, [1048 735 580 484 300]);
c.title('Rounded sectors');
c.Option.series{1}.itemStyle = struct('borderColor', '#fff', ...
  'borderWidth', 2, 'borderRadius', 10);
c.Option.series{1}.label = struct('show', false);
c.Option.series{1}.labelLine = struct('show', false);
c.Option.series{1}.emphasis = struct('label', ...
  struct('show', true, 'fontSize', 28, 'fontWeight', 'bold'));
c.show();
%=============================================================================
