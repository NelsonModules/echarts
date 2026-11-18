%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Pie chart: ticket types.
echarts.pie({'Bug','Feature','Docs','Support','Other'}, [42 30 10 15 3]).title('Ticket types').legend('left').show();
%=============================================================================
