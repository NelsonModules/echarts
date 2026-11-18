%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Air-quality radar comparing three cities across six pollutants.
axesN = {'AQI', 'PM2.5', 'PM10', 'CO', 'NO2', 'SO2'};
M = [ 55  58  43  12  38  10; ...
     120 140  90  25  70  45; ...
      80  92  70  18  52  22];
c = echarts.radar(axesN, M, 'Names', {'Coast', 'Industry', 'Suburb'});
c.title('Air quality by district');
c.Option.series{1}.areaStyle = struct('opacity', 0.1);
c.show();
%=============================================================================
