%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% json() round-trips to a valid ECharts option with series and axes.
c = echarts.bar({'a', 'b', 'c'}, [1 2 3]).title('T');
txt = c.json();
assert_istrue(ischar(txt) && ~isempty(txt));
decoded = jsondecode(txt);
assert_isequal(decoded.series(1).type, 'bar');
assert_isequal(decoded.title.text, 'T');
%=============================================================================
% pretty JSON is multi-line.
pretty = c.json('pretty', true);
assert_istrue(~isempty(strfind(pretty, char(10))));
%=============================================================================
% html() produces a self-contained document that inlines the library by default.
h = c.html();
assert_istrue(~isempty(strfind(h, '<!DOCTYPE html>')));
assert_istrue(~isempty(strfind(h, 'echarts.init')));
assert_istrue(~isempty(strfind(h, 'Apache Software Foundation')));
%=============================================================================
% The 'cdn' library references jsDelivr instead of inlining.
h = c.html('Library', 'cdn');
assert_istrue(~isempty(strfind(h, 'cdn.jsdelivr.net/npm/echarts')));
%=============================================================================
% A dark theme page initializes ECharts with the dark theme.
h = c.html('Theme', 'dark');
assert_istrue(~isempty(strfind(h, '"dark"')));
%=============================================================================
% fn() values are tagged so the page revives them as functions.
c = echarts.bar({'a'}, 1);
c.option('tooltip.formatter', echarts.fn('(p) => p.name'));
assert_istrue(~isempty(strfind(c.json(), '@js:')));
assert_istrue(~isempty(strfind(c.html(), '_revive')));
%=============================================================================
