%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bar chart: daily steps.
echarts.bar({'Mon','Tue','Wed','Thu','Fri','Sat','Sun'}, [6500 8200 7100 9000 5400 12000 10300], 'Names', {'Daily steps'}).title('Daily steps').ylabel('steps').show();
%=============================================================================
