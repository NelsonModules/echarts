%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Network graph: bipartite graph.
names = {'N1','N2','N3','N4','N5','N6','N7','N8'};
edges = [1 5; 1 7; 2 6; 2 8; 3 5; 3 7; 4 6; 4 8];
c = echarts.graph(names, edges); c.title('Bipartite graph');
c.Option.series{1}.layout = 'force';
c.Option.series{1}.lineStyle = struct('curveness', 0.15);
c.show();
%=============================================================================
