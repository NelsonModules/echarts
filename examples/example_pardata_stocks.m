%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Parallel coordinates: stock metrics.
echarts.parallel({'PE','Growth','Yield','Debt','Beta'}, [18 12 2 0.4 1.1; 25 20 1 0.6 1.4; 12 8 4 0.3 0.8]).title('Stock metrics').show();
%=============================================================================
