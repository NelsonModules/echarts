%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Area plot of decay area.
x = linspace(0, 4*pi, 300);
c = echarts.plot(x, exp(-x/4), 'Names', {'Decay area'});
c.title('Decay area'); c.area(true); c.Option.series{1}.symbol = 'none';
c.show();
%=============================================================================
