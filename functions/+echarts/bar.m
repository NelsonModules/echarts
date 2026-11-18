%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.bar(Y)
% c = echarts.bar(labels, Y)
% c = echarts.bar(..., 'Names', {...}, 'Title', '...')
%   Create a bar chart. Y is a vector (one series) or a matrix (one series per
%   column, rows aligned with the category labels). 'labels' is a cellstr or a
%   numeric vector; when omitted the categories are numbered 1..n.
%
%   Example:
%     c = echarts.bar({'Q1','Q2','Q3','Q4'}, [12 19 7 15]);
%     c.title('Quarterly revenue');
%     c.show();
function c = bar(varargin)
  c = categoryfactory('bar', varargin);
end
%=============================================================================
