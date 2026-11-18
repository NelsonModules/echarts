%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Candlestick with 5- and 10-day moving-average overlays.
n = 90;
close = cumsum(randn(1, n)) + 60;
open = close + 0.5 * randn(1, n);
high = max(open, close) + rand(1, n);
low = min(open, close) - rand(1, n);
ohlc = [open.', high.', low.', close.'];
dates = cell(1, n);
for k = 1:n
  dates{k} = sprintf('D%d', k);
end
c = echarts.candlestick(dates, ohlc);
c.title('Price with moving averages');
c.addSeries(movmean(close, 5), 'type', 'line', 'name', 'MA5', ...
  'symbol', 'none', 'smooth', true, 'lineStyle', struct('width', 1));
c.addSeries(movmean(close, 10), 'type', 'line', 'name', 'MA10', ...
  'symbol', 'none', 'smooth', true, 'lineStyle', struct('width', 1));
c.option('legend.show', true);
c.dataZoom('x');
c.show();
%=============================================================================
