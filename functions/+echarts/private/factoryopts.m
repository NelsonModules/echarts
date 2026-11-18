%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% o = factoryopts(args)
%   Parse the Name/Value options shared by the chart factory helpers. Returns a
%   struct with fields Names (cell array of series names) and Title (char).
%   Anything else must be set on the returned chart with its fluent methods.
function o = factoryopts(args)
  o = struct('Names', {{}}, 'Title', '');
  if mod(numel(args), 2) ~= 0
    error('echarts:factory', 'Name/Value arguments must come in pairs.');
  end
  for k = 1:2:numel(args)
    name = char(args{k});
    switch lower(name)
      case 'names'
        o.Names = args{k + 1};
      case 'title'
        o.Title = char(args{k + 1});
      otherwise
        error('echarts:factory', ['Unknown option "%s". Set other ECharts ', ...
          'options on the chart with its methods (option, legend, ...).'], name);
    end
  end
end
%=============================================================================
