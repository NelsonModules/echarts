%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Calendar heatmap: activity 2023.
days = datetime(2023,1,1):datetime(2023,12,31);
v = 8 + 6*abs(sin((1:numel(days))/15)) + 3*rand(1, numel(days));
echarts.calendar(days, v, 'Range', '2023').title('Activity 2023').show();
%=============================================================================
