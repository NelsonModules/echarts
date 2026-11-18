%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A gauge showing a single reading on a dial.
echarts.gauge(68, 'Name', 'SOC', 'Max', 100) ...
  .title('Battery charge') ...
  .show();
%=============================================================================
