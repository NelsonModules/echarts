%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% out = ascellstr(x)
%   Normalize labels to a row cell array of char. A string array or cell array
%   is converted, a char row becomes a single entry, and a numeric vector
%   becomes its formatted elements.
function out = ascellstr(x)
  if iscell(x)
    out = x(:).';
  elseif isstring(x)
    out = cellstr(x);
    out = out(:).';
  elseif ischar(x)
    out = {x};
  else
    v = double(x(:));
    out = cell(1, numel(v));
    for k = 1:numel(v)
      out{k} = sprintf('%g', v(k));
    end
  end
end
%=============================================================================
