%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% [found, info] = extregistry(name)
%   Look up an ECharts extension by its short name. 'info' carries the bundled
%   file name (under vendor/plugins) and the CDN URL used as a fallback and by
%   echarts.vendor. Unlike Chart.js, the ECharts core bundle already covers all
%   built-in chart types, so extensions are only the optional add-ons below.
%     'gl'         echarts-gl: 3D charts (bar3D, scatter3D, line3D, surface).
%     'wordcloud'  echarts-wordcloud: word-cloud series.
function [found, info] = extregistry(name)
  key = lower(strtrim(char(name)));
  switch key
    case 'gl'
      info = ext('echarts-gl.min.js', ...
        'https://cdn.jsdelivr.net/npm/echarts-gl@2.0.9/dist/echarts-gl.min.js');
    case 'wordcloud'
      info = ext('echarts-wordcloud.min.js', ...
        'https://cdn.jsdelivr.net/npm/echarts-wordcloud@2.1.0/dist/echarts-wordcloud.min.js');
    otherwise
      found = false;
      info = struct();
      return
  end
  found = true;
end
%=============================================================================
function info = ext(file, url)
  info = struct('file', file, 'url', url);
end
%=============================================================================
