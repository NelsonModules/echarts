%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% p = echarts.vendor()
% p = echarts.vendor('core')
% p = echarts.vendor('core', version)
% p = echarts.vendor(extensionName)
%   Download a library into the module's thirdparty/ folder so it renders
%   offline, and return the path it was written to. With no argument (or 'core')
%   it (re)downloads Apache ECharts itself; with an extension short name from the
%   registry ('gl', 'wordcloud', 'liquidfill') it downloads that extension into
%   thirdparty/plugins. Requires internet access.
function p = vendor(target, version)
  if nargin < 1 || isempty(target)
    target = 'core';
  end
  target = char(target);
  if strcmpi(target, 'core')
    v = libversion();
    if nargin >= 2 && ~isempty(version)
      v = char(version);
    end
    url = sprintf('https://cdn.jsdelivr.net/npm/echarts@%s/dist/echarts.min.js', v);
    p = vendorpath();
  else
    [found, info] = extregistry(target);
    if ~found
      error('echarts:vendor', 'Unknown extension "%s".', target);
    end
    url = info.url;
    p = [fileparts(vendorpath()), '/plugins/', info.file];
  end
  folder = fileparts(p);
  if ~isfolder(folder)
    mkdir(folder);
  end
  websave(p, url);
end
%=============================================================================
