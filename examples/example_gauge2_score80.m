%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Gauge: score.
c = echarts.gauge(80, 'Min', 0, 'Max', 100, 'Name', 'Score'); c.title('Score');
c.Option.series{1}.axisLine = struct('lineWidth', 16, 'color', {{{0.4,'#ee6666'},{0.7,'#fac858'},{1,'#91cc75'}}});
c.show();
%=============================================================================
