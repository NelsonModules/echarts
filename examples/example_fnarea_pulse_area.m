%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Area plot of pulse train.
x = linspace(0, 4*pi, 300);
c = echarts.plot(x, 0.5*(1+sign(sin(x))), 'Names', {'Pulse train'});
c.title('Pulse train'); c.area(true); c.Option.series{1}.symbol = 'none';
c.show();
%=============================================================================
