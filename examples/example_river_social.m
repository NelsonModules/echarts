%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Theme river: social mentions.
topics = {'Twitter','Reddit','News'};
dates = {}; values = []; names = {};
for d = 1:18
  day = sprintf('2024-04-%02d', d);
  for k = 1:numel(topics)
    dates{end+1} = day;
    values(end+1) = 6 + 4*(1+sin((d+2*k)/3)) + rand();
    names{end+1} = topics{k};
  end
end
echarts.themeRiver(dates, values, names).title('Social mentions').show();
%=============================================================================
