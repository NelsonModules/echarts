%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A long series with a zoom slider, opened on a sub-range.
n = 300;
x = 1:n;
y = 100 + cumsum(randn(1, n));
c = echarts.plot(x, y, 'Names', {'Signal'});
c.title('Data zoom');
c.area(true);
c.Option.series{1}.symbol = 'none';
c.dataZoom('x');
c.Option.dataZoom{1}.start = 55;
c.Option.dataZoom{1}.end = 85;
c.Option.dataZoom{2}.start = 55;
c.Option.dataZoom{2}.end = 85;
c.show();
%=============================================================================
