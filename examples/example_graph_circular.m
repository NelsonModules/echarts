%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Network graph with a circular layout and curved edges.
names = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'};
edges = [1 2; 1 4; 2 3; 3 5; 4 6; 5 7; 6 8; 7 1; 8 3; 2 6];
c = echarts.graph(names, edges);
c.title('Circular layout');
c.Option.series{1}.layout = 'circular';
c.Option.series{1}.circular = struct('rotateLabel', true);
c.Option.series{1}.lineStyle = struct('curveness', 0.2, 'color', 'source');
c.show();
%=============================================================================
