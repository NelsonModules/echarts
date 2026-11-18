%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Calendar heatmap: activity 2025.
days = datetime(2025,1,1):datetime(2025,12,31);
v = 8 + 6*abs(sin((1:numel(days))/15)) + 3*rand(1, numel(days));
echarts.calendar(days, v, 'Range', '2025').title('Activity 2025').show();
%=============================================================================
