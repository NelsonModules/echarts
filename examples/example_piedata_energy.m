%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Pie chart: energy mix.
echarts.pie({'Gas','Coal','Nuclear','Hydro','Wind','Solar'}, [34 27 15 10 8 6]).title('Energy mix').legend('left').show();
%=============================================================================
