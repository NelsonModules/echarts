%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series line: subject scores.
c = echarts.line({'W1','W2','W3','W4','W5'}, [70 60 80; 72 65 82; 75 68 78; 78 70 85; 80 72 88], 'Names', {'Math','Science','English'}); c.title('Subject scores'); c.smooth(true); c.show();
%=============================================================================
