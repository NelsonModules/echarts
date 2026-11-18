%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Line plot of product of sines.
x = linspace(0, 4*pi, 300);
echarts.plot(x, sin(x).*sin(3*x), 'Names', {'Product of sines'}).title('Product of sines').show();
%=============================================================================
