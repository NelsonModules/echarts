%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Pie chart: budget split.
echarts.pie({'R&D','Sales','Ops','Admin','Legal'}, [40 25 20 10 5]).title('Budget split').legend('left').show();
%=============================================================================
