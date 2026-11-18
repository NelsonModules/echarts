%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% out = trimtail(v, n)
%   Keep at most the last n elements of a vector or cell array (sliding window);
%   n = Inf keeps everything.
function out = trimtail(v, n)
  if ~isfinite(n)
    out = v;
    return
  end
  m = numel(v);
  if m <= n
    out = v;
    return
  end
  out = v(m - n + 1:end);
end
%=============================================================================
