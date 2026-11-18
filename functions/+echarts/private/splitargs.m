%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% [pos, nv] = splitargs(args)
%   Split a factory argument list into leading positional data arguments and a
%   trailing Name/Value tail. The tail starts at the first scalar-text argument
%   equal (case-insensitively) to a known option name ('Names' or 'Title'),
%   which cannot collide with a data argument (labels are cell/numeric).
function [pos, nv] = splitargs(args)
  keys = {'names', 'title'};
  idx = numel(args) + 1;
  for i = 1:numel(args)
    a = args{i};
    if (ischar(a) || isStringScalar(a)) && any(strcmpi(char(a), keys))
      idx = i;
      break
    end
  end
  pos = args(1:idx - 1);
  nv = args(idx:end);
end
%=============================================================================
