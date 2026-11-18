%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.wordcloud(words, weights)
% c = echarts.wordcloud(..., 'Title', '...')
%   Create a word cloud: each word is sized by its weight. 'words' is a cell
%   array of strings and 'weights' the matching magnitudes. Uses the bundled
%   echarts-wordcloud extension (loaded automatically).
%
%   Example:
%     echarts.wordcloud({'Nelson','ECharts','charts'}, [40 30 20]).show();
function c = wordcloud(words, weights, varargin)
  o = factoryopts(varargin);
  items = pievalues(words, weights);
  c = echarts.chart('wordCloud');
  c.Library = {'auto', 'wordcloud'};
  c.option('legend.show', false);
  c.option('tooltip.show', true);
  colorFn = '() => "hsl(" + Math.round(Math.random()*360) + ",60%,55%)"';
  c.addSeries(items, 'sizeRange', {14, 70}, 'rotationRange', {-45, 45}, ...
    'gridSize', 8, 'shape', 'circle', ...
    'textStyle', struct('color', echarts.fn(colorFn)));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
