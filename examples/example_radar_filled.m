%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Radar chart with filled areas for each series.
axesN = {'Sales', 'Admin', 'IT', 'Support', 'Dev', 'Marketing'};
M = [43 30 85 65 90 72; 50 70 72 60 80 65];
c = echarts.radar(axesN, M, 'Names', {'Budget', 'Spending'});
c.title('Budget radar');
c.Option.series{1}.areaStyle = struct('opacity', 0.25);
c.show();
%=============================================================================
