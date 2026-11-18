%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series bar: expense breakdown.
c = echarts.bar({'Jan','Feb','Mar','Apr'}, [30 22 15; 44 18 20; 25 33 12; 40 27 24], 'Names', {'Rent','Food','Fun'}); c.title('Expense breakdown'); c.stack(); c.show();
%=============================================================================
