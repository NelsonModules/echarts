%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Network graph: grid mesh.
names = {'N1','N2','N3','N4','N5','N6','N7','N8','N9','N10','N11','N12'};
edges = [1 2; 1 5; 2 3; 2 6; 3 4; 3 7; 4 8; 5 6; 5 9; 6 7; 6 10; 7 8; 7 11; 8 12; 9 10; 10 11; 11 12];
c = echarts.graph(names, edges); c.title('Grid mesh');
c.Option.series{1}.layout = 'force';
c.Option.series{1}.lineStyle = struct('curveness', 0.15);
c.show();
%=============================================================================
