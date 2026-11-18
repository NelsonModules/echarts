%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Network graph: cycle c12.
names = {'N1','N2','N3','N4','N5','N6','N7','N8','N9','N10','N11','N12'};
edges = [1 2; 2 3; 3 4; 4 5; 5 6; 6 7; 7 8; 8 9; 9 10; 10 11; 11 12; 12 1];
c = echarts.graph(names, edges); c.title('Cycle C12');
c.Option.series{1}.layout = 'circular';
c.Option.series{1}.lineStyle = struct('curveness', 0.15);
c.show();
%=============================================================================
