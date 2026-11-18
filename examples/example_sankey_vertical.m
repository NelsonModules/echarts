%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Vertical Sankey diagram (top-to-bottom flow).
src = {'Visits', 'Visits', 'Signup', 'Signup', 'Trial', 'Trial'};
tgt = {'Signup', 'Bounce', 'Trial', 'Churn', 'Paid', 'Expired'};
val = [60 40 35 25 20 15];
c = echarts.sankey(src, tgt, val);
c.title('Conversion flow');
c.Option.series{1}.orient = 'vertical';
c.Option.series{1}.label = struct('position', 'top');
c.show();
%=============================================================================
