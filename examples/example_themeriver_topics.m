%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Theme river of five topics over three weeks.
topics = {'News', 'Sports', 'Tech', 'Music', 'Film'};
dates = {}; values = []; names = {};
for d = 1:21
  day = sprintf('2024-03-%02d', d);
  for k = 1:5
    dates{end + 1} = day; %#ok<SAGROW>
    values(end + 1) = 6 + 5 * (1 + sin((d + 2 * k) / 4)) + 2 * rand(); %#ok<SAGROW>
    names{end + 1} = topics{k}; %#ok<SAGROW>
  end
end
echarts.themeRiver(dates, values, names).title('Topic mentions').show();
%=============================================================================
