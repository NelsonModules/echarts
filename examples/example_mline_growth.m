%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series line: user growth.
c = echarts.line({'Jan','Feb','Mar','Apr','May','Jun'}, [820 500; 932 620; 901 700; 934 820; 1290 950; 1330 1100], 'Names', {'Active','New'}); c.title('User growth'); c.smooth(true); c.show();
%=============================================================================
