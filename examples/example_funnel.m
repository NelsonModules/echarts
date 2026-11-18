%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A funnel chart of a sales conversion pipeline.
echarts.funnel({'Show', 'Click', 'Visit', 'Inquiry', 'Order'}, ...
  [100 80 60 40 20]) ...
  .title('Conversion') ...
  .show();
%=============================================================================
