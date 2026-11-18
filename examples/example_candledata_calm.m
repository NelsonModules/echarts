%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Candlestick: calm session.
n = 70;
close = cumsum(0.02 + 0.5*randn(1, n)) + 60;
open = close + 0.5*randn(1, n);
high = max(open, close) + rand(1, n);
low = min(open, close) - rand(1, n);
ohlc = [open.' high.' low.' close.'];
dates = cell(1, n); for k = 1:n; dates{k} = sprintf('D%d', k); end
echarts.candlestick(dates, ohlc).title('Calm session').dataZoom('x').show();
%=============================================================================
