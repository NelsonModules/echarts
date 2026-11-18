%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.line(Y)
% c = echarts.line(labels, Y)
% c = echarts.line(..., 'Names', {...}, 'Title', '...')
%   Create a line chart. Y is a vector (one series) or a matrix (one series per
%   column). 'labels' are the x-axis categories; when omitted they are 1..n.
%
%   Example:
%     c = echarts.line(1:10, [ (1:10).^0.5 ; log(1:10) ].', 'Names', {'sqrt','log'});
%     c.title('Growth');
%     c.show();
function c = line(varargin)
  c = categoryfactory('line', varargin);
end
%=============================================================================
