%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A single smoothed series with a vertical color gradient line and a matching
% translucent area fill.
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
c = echarts.line(days, [140 232 101 264 90 340 250], 'Names', {'Flow'});
c.title('Gradient line');
c.smooth(true);
stops = {struct('offset', 0, 'color', '#188df0'), ...
         struct('offset', 1, 'color', '#83bff6')};
grad = struct('type', 'linear', 'x', 0, 'y', 0, 'x2', 0, 'y2', 1, ...
  'colorStops', {stops});
areaStops = {struct('offset', 0, 'color', 'rgba(24,141,240,0.55)'), ...
             struct('offset', 1, 'color', 'rgba(131,191,246,0.05)')};
areaGrad = struct('type', 'linear', 'x', 0, 'y', 0, 'x2', 0, 'y2', 1, ...
  'colorStops', {areaStops});
c.Option.series{1}.lineStyle = struct('width', 3, 'color', grad);
c.Option.series{1}.areaStyle = struct('color', areaGrad);
c.Option.series{1}.symbol = 'none';
c.show();
%=============================================================================
