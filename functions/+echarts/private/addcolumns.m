%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% n = addcolumns(c, Y, names)
%   Add one series per column of Y to the chart c (a vector is a single
%   series). Returns the number of rows (categories) in Y.
function n = addcolumns(c, Y, names)
  if isvector(Y)
    Y = Y(:);
  end
  n = size(Y, 1);
  for j = 1:size(Y, 2)
    c.addSeries(Y(:, j), 'name', seriesname(names, j));
  end
end
%=============================================================================
