%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Candlestick with custom bullish / bearish colors.
dates = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Mon', 'Tue', 'Wed'};
ohlc = [20 25 18 23; 23 27 22 21; 21 24 19 24; 24 29 23 28; ...
        28 30 25 26; 26 28 24 25; 25 27 23 27; 27 31 26 30];
c = echarts.candlestick(dates, ohlc);
c.title('Custom candle colors');
c.Option.series{1}.itemStyle = struct( ...
  'color', '#26a69a', 'color0', '#ef5350', ...
  'borderColor', '#26a69a', 'borderColor0', '#ef5350');
c.show();
%=============================================================================
