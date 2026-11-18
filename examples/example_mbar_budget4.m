%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series bar: planned vs actual.
c = echarts.bar({'R&D','Sales','Ops','HR'}, [40 38; 25 30; 20 22; 10 12], 'Names', {'Planned','Actual'}); c.title('Planned vs actual'); c.show();
%=============================================================================
