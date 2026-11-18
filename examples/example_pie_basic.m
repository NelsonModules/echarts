%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A basic pie chart of access sources, with the legend on the left.
echarts.pie({'Search Engine', 'Direct', 'Email', 'Union Ads', 'Video Ads'}, ...
  [1048 735 580 484 300]) ...
  .title('Referrals') ...
  .legend('left') ...
  .show();
%=============================================================================
