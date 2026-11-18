%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bar chart: defects by type.
echarts.bar({'UI','Logic','Perf','Docs','Build'}, [23 41 12 8 5], 'Names', {'Defects by type'}).title('Defects by type').ylabel('count').show();
%=============================================================================
