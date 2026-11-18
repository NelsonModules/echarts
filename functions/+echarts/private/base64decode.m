%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% bytes = base64decode(s)
%   Decode a base64 string to a uint8 row vector. Whitespace and newlines are
%   ignored; '=' padding is handled. Used to turn a chart's getDataURL() data
%   URL into PNG bytes.
function bytes = base64decode(s)
  s = char(s);
  lut = -ones(1, 128);
  alphabet = ['ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz', ...
    '0123456789+/'];
  for i = 1:numel(alphabet)
    lut(double(alphabet(i))) = i - 1;
  end
  code = double(s);
  code = code(code >= 1 & code <= 128);
  v = lut(code);
  v = v(v >= 0);
  n = numel(v);
  r = mod(n, 4);
  if r == 1
    error('echarts:base64', 'Invalid base64 length.');
  end
  total = floor(n / 4) * 3 + max(0, r - 1);
  bytes = zeros(1, total, 'uint8');
  bi = 0;
  i = 1;
  while i + 3 <= n
    v1 = v(i); v2 = v(i + 1); v3 = v(i + 2); v4 = v(i + 3);
    bytes(bi + 1) = bitor(bitshift(v1, 2), bitshift(v2, -4));
    bytes(bi + 2) = bitand(bitor(bitshift(v2, 4), bitshift(v3, -2)), 255);
    bytes(bi + 3) = bitand(bitor(bitshift(v3, 6), v4), 255);
    bi = bi + 3;
    i = i + 4;
  end
  if r == 2
    v1 = v(i); v2 = v(i + 1);
    bytes(bi + 1) = bitor(bitshift(v1, 2), bitshift(v2, -4));
  elseif r == 3
    v1 = v(i); v2 = v(i + 1); v3 = v(i + 2);
    bytes(bi + 1) = bitor(bitshift(v1, 2), bitshift(v2, -4));
    bytes(bi + 2) = bitand(bitor(bitshift(v2, 4), bitshift(v3, -2)), 255);
  end
end
%=============================================================================
