%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A basic bar chart with a title, an axis label and value labels on each bar.
c = echarts.bar({'Q1', 'Q2', 'Q3', 'Q4'}, [128 196 143 205], 'Names', {'Revenue'});
c.title('Quarterly revenue');
c.ylabel('k EUR');
c.dataLabels('top');
c.show();
%=============================================================================
