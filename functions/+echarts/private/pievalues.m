%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% items = pievalues(labels, values)
%   Build an ECharts [{name, value}, ...] cell array for part-to-whole charts
%   (pie, doughnut, funnel) from labels and a vector of values.
function items = pievalues(labels, values)
  values = double(values(:));
  names = ascellstr(labels);
  n = numel(values);
  items = cell(n, 1);
  for k = 1:n
    if k <= numel(names)
      nm = names{k};
    else
      nm = sprintf('%d', k);
    end
    items{k} = struct('name', nm, 'value', values(k));
  end
end
%=============================================================================
