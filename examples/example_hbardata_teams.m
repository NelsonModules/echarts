%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Horizontal bar chart: team wins.
echarts.bar({'Reds','Blues','Greens','Golds','Grays'}, [21 18 15 12 9], 'Names', {'Team wins'}).horizontal().title('Team wins').dataLabels('right').show();
%=============================================================================
