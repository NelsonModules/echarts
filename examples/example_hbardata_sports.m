%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Horizontal bar chart: sport interest.
echarts.bar({'Soccer','Cricket','Basketball','Tennis','Golf'}, [48 30 25 15 8], 'Names', {'Sport interest'}).horizontal().title('Sport interest').dataLabels('right').show();
%=============================================================================
