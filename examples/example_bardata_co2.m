%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bar chart: co2 by sector.
echarts.bar({'Energy','Transport','Industry','Homes','Farming'}, [35 24 20 12 9], 'Names', {'CO2 by sector'}).title('CO2 by sector').ylabel('%').show();
%=============================================================================
