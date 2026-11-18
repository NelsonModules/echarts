%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A live, streaming line chart. In the WebView / WebAssembly desktop the chart
% is embedded in a UI figure and refreshes in place; MaxPoints keeps a sliding
% window of the most recent samples.
c = echarts.line((1:20), 50 + cumsum(randn(1, 20)), 'Names', {'Signal'});
c.title('Live signal');
c.MaxPoints = 60;
c.smooth(true);
c.show();
for k = 21:120
  c.append(k, 50 + 10 * sin(k / 6) + 3 * randn());
  drawnow();
  sleep(0.05);
end
%=============================================================================
