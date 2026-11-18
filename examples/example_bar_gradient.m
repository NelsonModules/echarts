%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bars filled with a vertical color gradient.
cats = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};
c = echarts.bar(cats, [220 182 191 234 290 330 310], 'Names', {'Value'});
c.title('Gradient bars');
c.option('legend.show', false);
stops = {struct('offset', 0, 'color', '#83bff6'), ...
         struct('offset', 0.5, 'color', '#188df0'), ...
         struct('offset', 1, 'color', '#188df0')};
grad = struct('type', 'linear', 'x', 0, 'y', 0, 'x2', 0, 'y2', 1, ...
  'colorStops', {stops});
c.Option.series{1}.itemStyle = struct('color', grad, 'borderRadius', {{6, 6, 0, 0}});
c.show();
%=============================================================================
