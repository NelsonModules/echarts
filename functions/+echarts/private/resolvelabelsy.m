%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% [labels, Y] = resolvelabelsy(pos)
%   Interpret the leading positional arguments of a category factory: one
%   argument is the data Y (labels auto-generated); two arguments are labels
%   then Y.
function [labels, Y] = resolvelabelsy(pos)
  switch numel(pos)
    case 1
      labels = [];
      Y = pos{1};
    case 2
      labels = pos{1};
      Y = pos{2};
    otherwise
      error('echarts:factory', 'Expected data, or labels and data.');
  end
end
%=============================================================================
