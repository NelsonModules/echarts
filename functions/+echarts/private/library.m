%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% scriptTag = library(lib)
%   Resolve one or more ECharts library sources into HTML <script> fragments.
%   'lib' is a single source or a cell array of sources (loaded in order, so
%   extensions come after the core library). Each source is one of:
%     'auto' / 'local' / 'bundled'  (default) inline the copy bundled with this
%              module, so charts render offline with no network access.
%     'cdn'    load the core library from the public jsDelivr CDN.
%     an extension short name (see extregistry), e.g. 'gl','wordcloud',
%              'liquidfill': inline the vendored extension if present, else from
%              the CDN.
%     'worldmap'   inline the bundled world GeoJSON and register it as the
%              'world' map (for echarts.choropleth / echarts.map).
%     an http(s) URL   load from that URL.
%     a path to a .js file   inline that file.
%   A bare extension name is expanded to {'auto', name} so the core library
%   loads first; in a cell array, include a core source ('auto'/'cdn'/...).
function scriptTag = library(lib)
  if nargin < 1 || isempty(lib)
    lib = 'auto';
  end
  if ~iscell(lib)
    if isExtra(lib)
      lib = {'auto', lib};
    else
      scriptTag = resolveOne(lib);
      return
    end
  end
  if ~hasCore(lib)
    lib = [{'auto'}, lib(:).'];
  end
  parts = cell(1, numel(lib));
  for k = 1:numel(lib)
    parts{k} = resolveOne(lib{k});
  end
  scriptTag = strjoin(parts, newline);
end
%=============================================================================
function tf = isExtra(lib)
  if ~(ischar(lib) || isStringScalar(lib))
    tf = false;
    return
  end
  key = lower(strtrim(char(lib)));
  tf = strcmp(key, 'worldmap') || extregistry(key);
end
%=============================================================================
function tf = hasCore(lib)
  cores = {'auto', 'local', 'bundled', 'inline', 'offline', 'cdn'};
  tf = false;
  for k = 1:numel(lib)
    if ischar(lib{k}) || isStringScalar(lib{k})
      if any(strcmp(lower(strtrim(char(lib{k}))), cores))
        tf = true;
        return
      end
    end
  end
end
%=============================================================================
function tag = resolveOne(lib)
  key = lower(strtrim(char(lib)));
  switch key
    case {'auto', 'local', 'bundled', 'inline', 'offline'}
      p = vendorpath();
      if ~isfile(p)
        if strcmp(key, 'auto')
          tag = coreCdnTag();
          return
        end
        error('echarts:libraryMissing', ['No bundled ECharts found at "%s". ', ...
          'Run echarts.vendor() to restore it, or use the ''cdn'' library.'], p);
      end
      tag = inlineFile(p);
    case 'cdn'
      tag = coreCdnTag();
    case 'worldmap'
      tag = worldMapTag();
    otherwise
      [isExt, info] = extregistry(key);
      if isExt
        pf = [fileparts(vendorpath()), '/plugins/', info.file];
        if isfile(pf)
          tag = inlineFile(pf);
        else
          tag = sprintf('<script src="%s"></script>', info.url);
        end
        return
      end
      raw = strtrim(char(lib));
      if startsWith(key, 'http')
        tag = sprintf('<script src="%s"></script>', raw);
      elseif isfile(raw)
        tag = inlineFile(raw);
      else
        error('echarts:library', 'Unknown library source "%s".', raw);
      end
  end
end
%=============================================================================
function tag = worldMapTag()
  mp = [fileparts(vendorpath()), '/maps/world.json'];
  if ~isfile(mp)
    error('echarts:mapMissing', 'No bundled world map found at "%s".', mp);
  end
  % Register the GeoJSON once the core library is available on the page.
  tag = ['<script>window.__nlsRegisterMap=function(){', ...
    'if(window.echarts){echarts.registerMap("world",', fileread(mp), ');}};', ...
    'if(window.echarts){window.__nlsRegisterMap();}</script>'];
end
%=============================================================================
function tag = coreCdnTag()
  tag = ['<script src="https://cdn.jsdelivr.net/npm/echarts@', ...
    libversion(), '/dist/echarts.min.js"></script>'];
end
%=============================================================================
function tag = inlineFile(p)
  code = fileread(p);
  tag = ['<script>', newline, code, newline, '</script>'];
end
%=============================================================================
