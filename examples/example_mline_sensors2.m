%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series line: sensor readings.
c = echarts.line({'Jan','Feb','Mar','Apr','May','Jun'}, [20 40; 22 38; 25 42; 24 45; 28 50; 30 48], 'Names', {'Temp','Humidity'}); c.title('Sensor readings'); c.smooth(true); c.show();
%=============================================================================
