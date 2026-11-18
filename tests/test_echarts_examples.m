%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Every bundled example builds and serializes to a valid ECharts option. The
% example scripts call show() to display; here show() is rewritten to json() so
% the option is assembled and serialized without opening any display.
exdir = [modulepath('echarts'), '/examples'];
entries = dir([exdir, '/example_*.m']);
assert_istrue(numel(entries) > 0);
for i = 1:numel(entries)
  src = fileread([exdir, '/', entries(i).name]);
  src = regexprep(src, 'show\(', 'json(');       % build instead of display
  src = regexprep(src, 'for k = 21:\d+', 'for k = 21:22');  % cap any live loop
  src = regexprep(src, 'drawnow\(\)', '[]');     % display-only, skip when building
  src = regexprep(src, 'sleep\([^)]*\)', '[]');  % display-only, skip when building
  try
    eval(src);
  catch e
    error('echarts:example', 'Example %s failed: %s', entries(i).name, e.message);
  end
end
%=============================================================================
% Every example file is listed in examples/index.json, and vice versa.
idx = jsondecode(fileread([exdir, '/index.json']));
ex = idx.examples;
if iscell(ex)
  listed = cellfun(@(e) e.file, ex, 'UniformOutput', false);
else
  listed = {ex.file};
end
for i = 1:numel(entries)
  assert_istrue(any(strcmp(listed, entries(i).name)));
end
assert_isequal(numel(listed), numel(entries));
%=============================================================================
