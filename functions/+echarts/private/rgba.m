%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% css = rgba(color, alpha)
%   Convert a color specification to a CSS 'rgba(r,g,b,a)' string with the
%   given alpha in [0,1]. 'color' is a '#rgb' / '#rrggbb' hex string, a 1x3 RGB
%   triplet with components in [0,1], or any other CSS color string (returned
%   unchanged).
function css = rgba(color, alpha)
  if nargin < 2
    alpha = 1;
  end
  alpha = max(0, min(1, double(alpha)));
  if isnumeric(color)
    comp = round(255 * max(0, min(1, double(color(:).'))));
    if numel(comp) ~= 3
      error('echarts:color', 'An RGB triplet must have three components.');
    end
    css = sprintf('rgba(%d, %d, %d, %g)', comp(1), comp(2), comp(3), alpha);
    return
  end
  txt = strtrim(char(color));
  if ~isempty(txt) && txt(1) == '#'
    comp = hex2rgb(txt);
    css = sprintf('rgba(%d, %d, %d, %g)', comp(1), comp(2), comp(3), alpha);
    return
  end
  css = txt;
end
%=============================================================================
function comp = hex2rgb(hex)
  h = hex(2:end);
  if numel(h) == 3
    h = [h(1) h(1) h(2) h(2) h(3) h(3)];
  end
  if numel(h) ~= 6
    error('echarts:color', 'Invalid hex color "%s".', hex);
  end
  comp = [hex2dec(h(1:2)), hex2dec(h(3:4)), hex2dec(h(5:6))];
end
%=============================================================================
