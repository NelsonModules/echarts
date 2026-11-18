%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% s = setpath(s, path, value)
%   Set a value into a (possibly nested) struct along a dotted path, creating
%   the intermediate structs as needed. Example:
%     s = setpath(struct(), 'xAxis.axisLabel.rotate', 45)
function s = setpath(s, path, value)
  keys = strsplit(char(path), '.');
  s = setLevel(s, keys, value);
end
%=============================================================================
function s = setLevel(s, keys, value)
  key = keys{1};
  if numel(keys) == 1
    s.(key) = value;
    return
  end
  if isfield(s, key) && isstruct(s.(key))
    child = s.(key);
  else
    child = struct();
  end
  s.(key) = setLevel(child, keys(2:end), value);
end
%=============================================================================
