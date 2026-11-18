%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bump (ranking) chart: each team's rank across rounds, with an inverted axis so
% rank 1 is on top.
rounds = {'R1', 'R2', 'R3', 'R4', 'R5', 'R6'};
ranks = [1 2 1 3 2 1; ...
         2 1 3 1 1 2; ...
         3 3 2 2 3 4; ...
         4 4 4 4 4 3];
c = echarts.line(rounds, ranks.', 'Names', {'Alpha', 'Beta', 'Gamma', 'Delta'});
c.title('League standings');
c.smooth(true);
c.Option.yAxis.inverse = true;
c.Option.yAxis.minInterval = 1;
for k = 1:numel(c.Option.series)
  c.Option.series{k}.symbolSize = 12;
  c.Option.series{k}.symbol = 'circle';
end
c.show();
%=============================================================================
