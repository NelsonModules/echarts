%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A doughnut (ring) chart with the slice names shown on the ring.
c = echarts.doughnut({'A', 'B', 'C', 'D'}, [335 310 274 235]);
c.title('Market share');
c.dataLabels('outside');
c.show();
%=============================================================================
