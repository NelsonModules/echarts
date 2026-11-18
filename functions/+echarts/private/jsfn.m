%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% s = jsfn(code)
%   Tag a piece of JavaScript so the rendered page revives it into a function
%   (see reviver). Shared by echarts.fn and the option helpers.
function s = jsfn(code)
  s = ['@js:', char(code)];
end
%=============================================================================
