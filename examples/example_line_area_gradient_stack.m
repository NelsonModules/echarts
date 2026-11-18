%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Gradient stacked area chart (each series has a translucent gradient fill).
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
Y = [120 132 101 134 190 230 210; ...
     220 182 191 234 290 330 310; ...
     150 232 201 154 190 330 410].';
colors = {'#5470c6', '#91cc75', '#fac858'};
c = echarts.area(days, Y, 'Names', {'Email', 'Ads', 'Search'});
c.title('Channel traffic');
c.stack();
for k = 1:3
  stops = {struct('offset', 0, 'color', colors{k}), ...
           struct('offset', 1, 'color', 'rgba(255,255,255,0.1)')};
  g = struct('type', 'linear', 'x', 0, 'y', 0, 'x2', 0, 'y2', 1, ...
    'colorStops', {stops});
  c.Option.series{k}.areaStyle = struct('opacity', 0.8, 'color', g);
  c.Option.series{k}.lineStyle = struct('color', colors{k});
  c.Option.series{k}.symbol = 'none';
end
c.show();
%=============================================================================
