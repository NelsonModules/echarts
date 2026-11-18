%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A Nightingale rose chart: a pie whose slices grow outward with their value.
c = echarts.pie({'rose 1', 'rose 2', 'rose 3', 'rose 4', 'rose 5', 'rose 6'}, ...
  [40 38 32 30 28 22]);
c.Option.series{1}.roseType = 'area';
c.Option.series{1}.radius = {'15%', '75%'};
c.title('Nightingale rose');
c.show();
%=============================================================================
