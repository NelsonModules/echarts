%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Radar chart: nutrition.
c = echarts.radar({'Protein','Carbs','Fat','Fiber','Sugar','Salt'}, [20 60 15 8 30 5], 'Names', {'Meal'}); c.title('Nutrition'); c.Option.series{1}.areaStyle = struct('opacity', 0.15); c.show();
%=============================================================================
