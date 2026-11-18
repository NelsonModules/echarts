%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.map(regions, values)
% c = echarts.map(..., 'Title', '...')
%   Create a geographic map series shaded by value, on the bundled world map.
%   'regions' is a cell array of English country names as used by the map and
%   'values' the matching data. This is the general map entry point; see
%   echarts.choropleth for the same chart with a ready colored visual map.
%
%   Example:
%     echarts.map({'France','China','Brazil'}, [10 40 25]).show();
function c = map(regions, values, varargin)
  c = echarts.choropleth(regions, values, varargin{:});
end
%=============================================================================
