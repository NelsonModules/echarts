%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% out = defaultlabels(labels, n)
%   Resolve category labels: an empty input becomes 1..n, a string array is
%   converted to a cell array of char, and a cellstr or numeric vector is kept.
function out = defaultlabels(labels, n)
  if isempty(labels)
    out = 1:n;
    return
  end
  if isstring(labels)
    out = cellstr(labels);
    out = out(:).';
    return
  end
  out = labels;
end
%=============================================================================
