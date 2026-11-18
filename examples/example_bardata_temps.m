%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bar chart: monthly temperature.
echarts.bar({'Jan','Feb','Mar','Apr','May','Jun'}, [4 6 11 16 21 25], 'Names', {'Monthly temperature'}).title('Monthly temperature').ylabel('deg C').show();
%=============================================================================
