%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A Sankey diagram of an energy flow from sources to end uses.
src = {'Coal', 'Gas', 'Solar', 'Grid', 'Grid', 'Grid'};
tgt = {'Grid', 'Grid', 'Grid', 'Homes', 'Industry', 'Transport'};
val = [35 25 20 30 32 18];
echarts.sankey(src, tgt, val).title('Energy flow').show();
%=============================================================================
