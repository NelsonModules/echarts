%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = categoryfactory(type, args)
%   Shared builder for category charts (bar, line): one series per column of the
%   data, with shared category labels on the x-axis.
function c = categoryfactory(type, args)
  [pos, nv] = splitargs(args);
  o = factoryopts(nv);
  c = echarts.chart(type);
  [labels, Y] = resolvelabelsy(pos);
  nrows = addcolumns(c, Y, o.Names);
  c.labels(defaultlabels(labels, nrows));
  if ~isempty(o.Title)
    c.title(o.Title);
  end
end
%=============================================================================
