%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Half-doughnut chart (a semicircular ring from 180 to 360 degrees).
c = echarts.pie({'A', 'B', 'C', 'D', 'E'}, [1048 735 580 484 300]);
c.title('Half doughnut');
c.Option.series{1}.radius = {'40%', '70%'};
c.Option.series{1}.center = {'50%', '70%'};
c.Option.series{1}.startAngle = 180;
c.Option.series{1}.endAngle = 360;
c.show();
%=============================================================================
