%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Highlight time ranges on a line chart with shaded mark areas (morning and
% evening peaks).
hours = cell(1, 24);
for k = 1:24
  hours{k} = sprintf('%d:00', k - 1);
end
load = 20 + 30 * exp(-((0:23) - 9) .^ 2 / 8) + 40 * exp(-((0:23) - 19) .^ 2 / 6);
c = echarts.line(hours, load, 'Names', {'Load'});
c.title('Daily load with peak windows');
c.smooth(true);
c.xregion('7:00', '10:00', 'itemStyle', struct('color', 'rgba(255,173,177,0.4)'));
c.xregion('17:00', '21:00', 'itemStyle', struct('color', 'rgba(255,173,177,0.4)'));
c.show();
%=============================================================================
