%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bars drawn over a faint full-height background track (showBackground).
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
c = echarts.bar(days, [120 200 150 80 70 110 130], 'Names', {'Visits'});
c.title('Bars with background track');
c.option('legend.show', false);
c.Option.series{1}.showBackground = true;
c.Option.series{1}.backgroundStyle = struct('color', 'rgba(180,180,180,0.2)');
c.show();
%=============================================================================
