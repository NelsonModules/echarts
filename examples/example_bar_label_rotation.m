%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Rotated category labels and rotated value labels for crowded categories.
cats = {'Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', ...
  'Thursday', 'Friday'};
c = echarts.bar(cats, [120 200 150 80 70 110 130], 'Names', {'Visits'});
c.title('Rotated labels');
c.option('legend.show', false);
c.Option.xAxis.axisLabel = struct('rotate', 40, 'interval', 0);
c.Option.series{1}.label = struct('show', true, 'position', 'top', 'rotate', 90, ...
  'align', 'left', 'verticalAlign', 'middle');
c.show();
%=============================================================================
