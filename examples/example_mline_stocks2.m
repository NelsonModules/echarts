%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series line: two stocks.
c = echarts.line({'Jan','Feb','Mar','Apr','May','Jun'}, [100 50; 110 55; 108 60; 120 58; 125 65; 130 70], 'Names', {'ACME','GLOBEX'}); c.title('Two stocks'); c.smooth(true); c.show();
%=============================================================================
