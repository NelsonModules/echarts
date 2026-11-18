%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bar chart: tickets by day.
echarts.bar({'Mon','Tue','Wed','Thu','Fri'}, [32 45 28 51 39], 'Names', {'Tickets by day'}).title('Tickets by day').ylabel('count').show();
%=============================================================================
