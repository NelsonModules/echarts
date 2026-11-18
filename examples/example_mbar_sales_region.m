%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series bar: sales by region.
c = echarts.bar({'Q1','Q2','Q3','Q4'}, [60 40 30; 72 55 36; 85 58 44; 91 70 52], 'Names', {'EU','US','Asia'}); c.title('Sales by region'); c.show();
%=============================================================================
