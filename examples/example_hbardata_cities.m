%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Horizontal bar chart: city population.
echarts.bar({'Tokyo','Delhi','Shanghai','Sao Paulo','Cairo'}, [37 32 28 22 21], 'Names', {'City population'}).horizontal().title('City population').dataLabels('right').show();
%=============================================================================
