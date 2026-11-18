%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A sorted horizontal bar "race" snapshot (largest on top), with value labels.
names = {'Rust', 'Go', 'Python', 'C++', 'Java', 'JavaScript', 'C#'};
vals = [92 78 88 95 70 83 74];
c = echarts.bar(names, vals, 'Names', {'Popularity'});
c.title('Language popularity');
c.horizontal();
c.option('yAxis.inverse', true);
c.option('legend.show', false);
c.Option.series{1}.realtimeSort = true;
c.Option.series{1}.itemStyle = struct('borderRadius', {{0, 6, 6, 0}});
c.dataLabels('right');
c.show();
%=============================================================================
