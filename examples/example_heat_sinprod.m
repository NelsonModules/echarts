%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Heatmap: product of sines.
echarts.heatmap(sin((1:24)/3).' * sin((1:24)/3)).title('Product of sines').show();
%=============================================================================
