%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% t = target()
%   Decide how a chart should be displayed in the current Nelson session:
%     'webview' the WebView / WebAssembly desktop, where a chart can be
%               embedded live in a UI figure with uihtml.
%     'qt'      the Qt desktop, where uihtml is unavailable: a self-contained
%               HTML page is opened in the HTML viewer instead (degraded, no
%               live engine-to-page updates).
%     'cli'     no desktop: the page is opened in the system browser.
function t = target()
  if iswasm() || strcmp(getnelsonmode(), 'WEB_GUI')
    t = 'webview';
  elseif strcmp(getnelsonmode(), 'GUI')
    t = 'qt';
  else
    t = 'cli';
  end
end
%=============================================================================
