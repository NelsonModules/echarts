%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% out = escapehtml(text)
%   Escape the five markup-significant characters so an arbitrary string can be
%   placed safely inside markup.
function out = escapehtml(text)
  out = char(text);
  out = strrep(out, '&', '&amp;');
  out = strrep(out, '<', '&lt;');
  out = strrep(out, '>', '&gt;');
  out = strrep(out, '"', '&quot;');
  out = strrep(out, '''', '&#39;');
end
%=============================================================================
