%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A force-directed network graph; drag the nodes and scroll to zoom.
names = {'Core', 'IO', 'Parser', 'Engine', 'Graphics', 'GUI', 'Tests'};
edges = [1 2; 1 3; 1 4; 4 5; 5 6; 1 7; 4 7; 3 4];
echarts.graph(names, edges) ...
  .title('Module dependencies') ...
  .show();
%=============================================================================
