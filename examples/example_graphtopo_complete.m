%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Network graph: complete graph k7.
names = {'N1','N2','N3','N4','N5','N6','N7'};
edges = [1 2; 1 3; 1 4; 1 5; 1 6; 1 7; 2 3; 2 4; 2 5; 2 6; 2 7; 3 4; 3 5; 3 6; 3 7; 4 5; 4 6; 4 7; 5 6; 5 7; 6 7];
c = echarts.graph(names, edges); c.title('Complete graph K7');
c.Option.series{1}.layout = 'circular';
c.Option.series{1}.lineStyle = struct('curveness', 0.15);
c.show();
%=============================================================================
