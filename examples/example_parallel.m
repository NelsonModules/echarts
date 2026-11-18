%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A parallel-coordinates plot of a small multivariate data set.
dims = {'Price', 'Power', 'Weight', 'Range', 'Comfort'};
M = [20 150 1.2 500 7; 35 200 1.5 420 8; 28 120 1.1 610 6; ...
     42 260 1.8 380 9; 18 90 0.9 650 5];
echarts.parallel(dims, M).title('Vehicles').show();
%=============================================================================
