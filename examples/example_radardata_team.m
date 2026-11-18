%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Radar chart: team metrics.
c = echarts.radar({'Velocity','Quality','Morale','Focus','Delivery'}, [70 85 80 65 90; 80 70 75 85 70], 'Names', {'Q1','Q2'}); c.title('Team metrics'); c.Option.series{1}.areaStyle = struct('opacity', 0.15); c.show();
%=============================================================================
