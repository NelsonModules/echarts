%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Sankey: water usage.
echarts.sankey({'Supply','Supply','Homes','Homes','Industry'}, {'Homes','Industry','Drinking','Garden','Cooling'}, [60 40 35 25 40]).title('Water usage').show();
%=============================================================================
