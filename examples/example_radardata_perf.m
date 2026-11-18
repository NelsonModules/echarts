%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Radar chart: performance.
c = echarts.radar({'Speed','Memory','IO','CPU','Net','Battery'}, [90 70 60 85 75 80], 'Names', {'Device'}); c.title('Performance'); c.Option.series{1}.areaStyle = struct('opacity', 0.15); c.show();
%=============================================================================
