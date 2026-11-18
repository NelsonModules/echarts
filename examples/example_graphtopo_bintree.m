%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Network graph: binary tree graph.
names = {'N1','N2','N3','N4','N5','N6','N7','N8','N9','N10','N11','N12','N13','N14','N15'};
edges = [1 2; 1 3; 2 4; 2 5; 3 6; 3 7; 4 8; 4 9; 5 10; 5 11; 6 12; 6 13; 7 14; 7 15];
c = echarts.graph(names, edges); c.title('Binary tree graph');
c.Option.series{1}.layout = 'force';
c.Option.series{1}.lineStyle = struct('curveness', 0.15);
c.show();
%=============================================================================
