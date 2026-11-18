%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Radar chart: climate.
c = echarts.radar({'Temp','Rain','Wind','Humidity','Sun'}, [70 40 55 60 80; 50 70 45 75 50], 'Names', {'City A','City B'}); c.title('Climate'); c.Option.series{1}.areaStyle = struct('opacity', 0.15); c.show();
%=============================================================================
