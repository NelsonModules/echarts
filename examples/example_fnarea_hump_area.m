%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Area plot of smooth hump.
x = linspace(0, 4*pi, 300);
c = echarts.plot(x, exp(-(x-6).^2/8) .* (1+0.2*sin(x)), 'Names', {'Smooth hump'});
c.title('Smooth hump'); c.area(true); c.Option.series{1}.symbol = 'none';
c.show();
%=============================================================================
