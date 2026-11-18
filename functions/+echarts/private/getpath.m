%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% [value, found] = getpath(s, path, default)
%   Read a value from a nested struct along a dotted path. Returns 'default'
%   (default []) and found=false when any level is missing.
function [value, found] = getpath(s, path, default)
  if nargin < 3
    default = [];
  end
  keys = strsplit(char(path), '.');
  value = s;
  found = true;
  for k = 1:numel(keys)
    if isstruct(value) && isfield(value, keys{k})
      value = value.(keys{k});
    else
      value = default;
      found = false;
      return
    end
  end
end
%=============================================================================
