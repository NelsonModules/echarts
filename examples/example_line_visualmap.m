%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Color a line by its y value with a piecewise visual map (an air-quality style
% chart where segments turn red above a threshold).
hours = cell(1, 24);
for k = 1:24
  hours{k} = sprintf('%d:00', k - 1);
end
aqi = round(60 + 70 * sin((0:23) / 3) + 30 * rand(1, 24));
c = echarts.line(hours, aqi, 'Names', {'AQI'});
c.title('Air quality index');
c.smooth(true);
c.option('legend.show', false);
c.Option.visualMap = struct('top', 50, 'right', 10, ...
  'pieces', {{struct('gt', 0, 'lte', 80, 'color', '#5470c6'), ...
              struct('gt', 80, 'lte', 120, 'color', '#fac858'), ...
              struct('gt', 120, 'color', '#ee6666')}}, ...
  'outOfRange', struct('color', '#999'));
c.show();
%=============================================================================
