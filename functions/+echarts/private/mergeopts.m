%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% out = mergeopts(base, override)
%   Deep-merge two scalar structs. Fields present in 'override' win; when both
%   sides hold a scalar struct for the same field they are merged recursively.
%   Non-struct values (including arrays and cells) replace wholesale.
function out = mergeopts(base, override)
  if ~isstruct(base)
    out = override;
    return
  end
  if ~isstruct(override)
    out = base;
    return
  end
  out = base;
  names = fieldnames(override);
  for k = 1:numel(names)
    name = names{k};
    value = override.(name);
    if isfield(out, name) && isScalarStruct(out.(name)) && isScalarStruct(value)
      out.(name) = mergeopts(out.(name), value);
    else
      out.(name) = value;
    end
  end
end
%=============================================================================
function tf = isScalarStruct(x)
  tf = isstruct(x) && isscalar(x);
end
%=============================================================================
