%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series line: city temperatures.
c = echarts.line({'Jan','Feb','Mar','Apr','May','Jun'}, [4 2; 6 5; 11 9; 16 14; 21 18; 25 22], 'Names', {'Paris','London'}); c.title('City temperatures'); c.smooth(true); c.show();
%=============================================================================
