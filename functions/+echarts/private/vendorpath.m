%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% p = vendorpath()
%   Absolute path of the Apache ECharts library bundled with this module, under
%   the module's thirdparty/ folder. Extensions (thirdparty/plugins) and maps
%   (thirdparty/maps) live next to it. It is shipped so charts render offline by
%   default; echarts.vendor can refresh it.
function p = vendorpath()
  % <root>/functions/+echarts/private/vendorpath.m -> <root>
  root = fileparts(fileparts(fileparts(fileparts(mfilename('fullpath')))));
  p = [root, '/thirdparty/echarts.min.js'];
end
%=============================================================================
