%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Heatmap: confusion matrix.
echarts.heatmap(round(50*eye(6) + 8*rand(6,6))).title('Confusion matrix').show();
%=============================================================================
