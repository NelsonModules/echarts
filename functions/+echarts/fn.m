%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% s = echarts.fn(code)
%   Mark a piece of JavaScript as a function / expression to inject into an
%   ECharts option. ECharts accepts functions in many places (label and tooltip
%   formatters, scriptable colors, symbol sizes) that plain data cannot express;
%   the rendered page converts the marked value back into a real function.
%   'code' is a JavaScript expression (usually an arrow function).
%
%   Example:
%     c = echarts.bar({'a','b','c'}, [1 2 3]);
%     c.option('tooltip.formatter', echarts.fn('(p) => p.name + ": " + p.value'));
%     c.show();
function s = fn(code)
  s = jsfn(code);
end
%=============================================================================
