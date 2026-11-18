%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% opts = parseRenderOptions(obj, Name, Value, ...)
%   Collect the display/export options shared by html, save and show into a
%   struct with fields PageTitle, Width, Height, Theme, Toolbar and Library.
%   Defaults come from the chart: the title text for PageTitle, 0 for
%   Width/Height (fill), the chart Theme, and the chart Library.
function opts = parseRenderOptions(obj, varargin)
  opts = struct();
  opts.PageTitle = defaultTitle(obj);
  opts.Width = 0;
  opts.Height = 0;
  opts.Library = obj.Library;
  opts.Theme = obj.Theme;
  opts.Toolbar = false;
  opts.OnReady = char(obj.OnReady);
  if mod(numel(varargin), 2) ~= 0
    error('echarts:renderOptions', 'Name/Value arguments must come in pairs.');
  end
  for k = 1:2:numel(varargin)
    name = char(varargin{k});
    value = varargin{k + 1};
    switch lower(name)
      case 'pagetitle'
        opts.PageTitle = char(value);
      case 'width'
        opts.Width = double(value);
      case 'height'
        opts.Height = double(value);
      case 'library'
        opts.Library = value;
      case 'theme'
        opts.Theme = char(value);
      case 'toolbar'
        opts.Toolbar = logical(value);
      case 'onready'
        opts.OnReady = char(value);
      otherwise
        error('echarts:renderOptions', 'Unknown option "%s".', name);
    end
  end
end
%=============================================================================
function t = defaultTitle(obj)
  [value, found] = getpath(obj.Option, 'title.text', '');
  if found && ~isempty(value)
    t = char(value);
  else
    t = 'Nelson echarts';
  end
end
%=============================================================================
