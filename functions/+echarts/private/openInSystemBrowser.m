%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% openInSystemBrowser(filename)
%   Open a local HTML file in the operating-system default browser. Used as the
%   display fallback outside the webview module (which is not loaded in a plain
%   terminal session).
function openInSystemBrowser(filename)
  f = char(filename);
  if ispc()
    winopen(f);
  elseif ismac()
    unix(['open "', f, '" &']);
  else
    unix(['xdg-open "', f, '" &']);
  end
end
%=============================================================================
