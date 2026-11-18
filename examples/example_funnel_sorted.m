%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Ascending pyramid funnel (sorted smallest-first).
c = echarts.funnel({'Paid', 'Order', 'Cart', 'Visit', 'Impression'}, ...
  [20 40 60 80 100]);
c.title('Pyramid');
c.Option.series{1}.sort = 'ascending';
c.Option.series{1}.label = struct('show', true, 'position', 'inside', ...
  'formatter', '{b}: {c}');
c.show();
%=============================================================================
