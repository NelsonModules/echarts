%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Log axis: three exponential series on a logarithmic y-axis.
x = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10'};
n = 1:10;
c = echarts.line(x, [(2 .^ n).', (3 .^ n).', (1 ./ (2 .^ n)).' * 1e4], ...
  'Names', {'2^x', '3^x', '1/2^x'});
c.title('Logarithmic axis');
c.logscale('y');
c.show();
%=============================================================================
