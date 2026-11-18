%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.candlestick(dates, OHLC)
% c = echarts.candlestick(..., 'Title', '...')
%   Create a candlestick (OHLC) chart. 'dates' are the category labels; OHLC is
%   an n-by-4 matrix with columns [open, high, low, close], one row per date.
%
%   Example:
%     d = {'Mon','Tue','Wed','Thu','Fri'};
%     ohlc = [20 25 18 23; 23 27 22 21; 21 24 19 24; 24 29 23 28; 28 30 25 26];
%     echarts.candlestick(d, ohlc).title('Session').show();
function c = candlestick(dates, OHLC, varargin)
  o = factoryopts(varargin);
  OHLC = double(OHLC);
  if size(OHLC, 2) ~= 4
    error('echarts:candlestick', 'OHLC must have four columns [open, high, low, close].');
  end
  n = size(OHLC, 1);
  % ECharts candlestick expects [open, close, low, high] per item.
  data = cell(n, 1);
  for k = 1:n
    data{k} = [OHLC(k, 1), OHLC(k, 4), OHLC(k, 3), OHLC(k, 2)];
  end
  c = echarts.chart('candlestick');
  c.labels(dates);
  c.option('legend.show', false);
  c.option('yAxis.scale', true);
  c.addSeries(data, 'name', seriesname(o.Names, 1));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
