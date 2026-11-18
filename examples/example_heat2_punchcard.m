%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Heatmap: commits by day/hour.
echarts.heatmap(round(10*rand(7,24).*repmat(sin((1:24)/4)+1,7,1))).title('Commits by day/hour').show();
%=============================================================================
