%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.area(Y)
% c = echarts.area(labels, Y)
% c = echarts.area(..., 'Names', {...}, 'Title', '...')
%   Create a filled area chart (a line chart with the area under each series
%   filled). Y is a vector or a matrix of columns sharing the category labels.
%
%   Example:
%     c = echarts.area({'Mon','Tue','Wed'}, [120 132 101]);
%     c.title('Traffic');
%     c.show();
function c = area(varargin)
  c = categoryfactory('line', varargin);
  c.area(true);
  c.smooth(true);
end
%=============================================================================
