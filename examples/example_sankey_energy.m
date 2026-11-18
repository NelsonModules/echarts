%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A larger energy Sankey with several intermediate nodes.
src = {'Coal', 'Gas', 'Solar', 'Wind', 'Grid', 'Grid', 'Grid', 'Grid', ...
  'Industry', 'Homes'};
tgt = {'Grid', 'Grid', 'Grid', 'Grid', 'Industry', 'Homes', 'Transport', ...
  'Export', 'Losses', 'Losses'};
val = [35 25 20 15 32 28 20 15 10 8];
echarts.sankey(src, tgt, val).title('Energy balance').show();
%=============================================================================
