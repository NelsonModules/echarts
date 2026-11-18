%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Network graph: wheel network.
names = {'N1','N2','N3','N4','N5','N6','N7','N8','N9'};
edges = [1 2; 1 3; 1 4; 1 5; 1 6; 1 7; 1 8; 1 9; 2 3; 3 4; 4 5; 5 6; 6 7; 7 8; 8 9; 9 2];
c = echarts.graph(names, edges); c.title('Wheel network');
c.Option.series{1}.layout = 'circular';
c.Option.series{1}.lineStyle = struct('curveness', 0.15);
c.show();
%=============================================================================
