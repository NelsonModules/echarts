%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A word cloud (uses the bundled echarts-wordcloud extension).
words = {'Nelson', 'ECharts', 'charts', 'matrix', 'plot', 'scatter', ...
  'heatmap', 'sankey', 'radar', 'graph', 'offline', 'WebView', ...
  'treemap', 'sunburst', 'candlestick', 'gauge'};
weights = [100 90 70 55 52 50 48 42 40 38 34 30 28 26 24 20];
echarts.wordcloud(words, weights).title('Toolbox keywords').show();
%=============================================================================
