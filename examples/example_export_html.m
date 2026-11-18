%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Export a chart as a self-contained HTML file (the ECharts library is inlined,
% so the page renders offline with no network access).
c = echarts.bar({'A', 'B', 'C', 'D'}, [23 45 12 38], 'Names', {'Score'});
c.title('Exported chart');
c.toolbox('Features', {'saveAsImage'});
f = [tempdir(), 'echarts_export.html'];
c.save(f, 'Width', 800, 'Height', 500);
disp(['Chart written to: ', f]);
%=============================================================================
