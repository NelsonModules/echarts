%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Many slices with a scrollable legend on the right.
names = cell(1, 20);
vals = zeros(1, 20);
for k = 1:20
  names{k} = sprintf('Item %d', k);
  vals(k) = round(100 * rand() + 10);
end
c = echarts.pie(names, vals);
c.title('Scrollable legend');
c.Option.series{1}.radius = '55%';
c.Option.series{1}.center = {'40%', '55%'};
c.Option.series{1}.label = struct('show', false);
c.Option.legend = struct('type', 'scroll', 'orient', 'vertical', ...
  'right', 10, 'top', 40, 'bottom', 20);
c.show();
%=============================================================================
