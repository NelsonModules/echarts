%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% name = seriesname(names, k)
%   Resolve the name of the k-th series from a cell array of names, a single
%   char (used for the first series), or a default 'Series k'.
function name = seriesname(names, k)
  if iscell(names) && numel(names) >= k && ~isempty(names{k})
    name = char(names{k});
  elseif ischar(names) && k == 1
    name = names;
  else
    name = sprintf('Series %d', k);
  end
end
%=============================================================================
