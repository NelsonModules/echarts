%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Data zoom: zoomable bars.
n = 60; cat = cell(1,n); for k=1:n; cat{k}=sprintf('%%d',k); end
vals = 50 + cumsum(randn(1,n));
c = echarts.bar(cat, vals); c.dataZoom('x');
c.title('Zoomable bars'); c.show();
%=============================================================================
