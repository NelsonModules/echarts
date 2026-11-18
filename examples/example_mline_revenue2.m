%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series line: revenue vs cost.
c = echarts.line({'Jan','Feb','Mar','Apr','May','Jun'}, [120 80; 132 90; 101 85; 134 95; 190 120; 230 140], 'Names', {'Revenue','Cost'}); c.title('Revenue vs cost'); c.smooth(true); c.show();
%=============================================================================
