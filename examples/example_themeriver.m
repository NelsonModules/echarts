%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A theme-river (stream graph) of three topics over several days.
dates = {}; values = []; names = {};
topics = {'DQ', 'TY', 'SS'};
base = [8 6 4];
for d = 1:12
  day = sprintf('2024-01-%02d', d);
  for k = 1:3
    dates{end + 1} = day; %#ok<SAGROW>
    values(end + 1) = base(k) + 4 * abs(sin((d + k) / 3)); %#ok<SAGROW>
    names{end + 1} = topics{k}; %#ok<SAGROW>
  end
end
echarts.themeRiver(dates, values, names).title('Mentions over time').show();
%=============================================================================
