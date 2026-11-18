%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Force graph with weighted edges whose width follows the edge value.
names = {'Core', 'IO', 'Parser', 'Engine', 'Graphics', 'GUI'};
edges = [1 2 6; 1 3 4; 1 4 8; 4 5 5; 5 6 3; 1 6 2; 4 6 4];
c = echarts.graph(names, edges);
c.title('Weighted dependencies');
c.Option.series{1}.lineStyle = struct('curveness', 0.1, 'opacity', 0.7, ...
  'width', echarts.fn('(p) => Math.max(1, p.value || 1)'));
c.Option.series{1}.edgeLabel = struct('show', true, ...
  'formatter', echarts.fn('(p) => p.value'));
c.show();
%=============================================================================
