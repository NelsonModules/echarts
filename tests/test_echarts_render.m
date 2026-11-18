%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A baseline chart inlines the core ECharts library and initializes it.
base = echarts.bar({'a', 'b'}, [1 2]);
h = base.html();
assert_istrue(~isempty(strfind(h, '<!DOCTYPE html>')));
assert_istrue(~isempty(strfind(h, 'echarts.init')));
assert_istrue(~isempty(strfind(h, 'Apache Software Foundation')));
baseLen = length(h);
%=============================================================================
% The 3D charts additionally inline the echarts-gl extension (~0.6 MB).
h3d = echarts.surface(magic(6)).html();
assert_istrue(length(h3d) > baseLen + 400000);
%=============================================================================
% The word cloud additionally inlines the echarts-wordcloud extension.
hwc = echarts.wordcloud({'a', 'b'}, [2 1]).html();
assert_istrue(length(hwc) > baseLen + 8000);
%=============================================================================
% The world map charts register the bundled 'world' map.
hmap = echarts.choropleth({'France'}, 10).html();
assert_istrue(~isempty(strfind(hmap, 'registerMap("world"')));
%=============================================================================
% The dark theme initializes ECharts with the dark theme.
hdark = base.html('Theme', 'dark');
assert_istrue(~isempty(strfind(hdark, '"dark"')));
%=============================================================================
% The 'cdn' library references jsDelivr instead of inlining the core library.
hcdn = base.html('Library', 'cdn');
assert_istrue(~isempty(strfind(hcdn, 'cdn.jsdelivr.net/npm/echarts')));
assert_istrue(isempty(strfind(hcdn, 'Apache Software Foundation')));
%=============================================================================
% The toolbar adds the PNG / SVG download controls.
htb = base.html('Toolbar', true);
assert_istrue(~isempty(strfind(htb, 'Download PNG')));
assert_istrue(~isempty(strfind(htb, 'Download SVG')));
%=============================================================================
% A fixed width and height constrain the page wrapper.
hfix = base.html('Width', 640, 'Height', 480);
assert_istrue(~isempty(strfind(hfix, '640px')));
assert_istrue(~isempty(strfind(hfix, '480px')));
%=============================================================================
