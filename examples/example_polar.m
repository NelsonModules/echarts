%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A polar bar chart (bars arranged around a circle).
dirs = {'N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'};
freq = [5 8 12 6 4 7 10 9];
echarts.polar(dirs, freq).title('Wind rose').show();
%=============================================================================
