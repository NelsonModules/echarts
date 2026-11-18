%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series line: channel traffic.
c = echarts.line({'Jan','Feb','Mar','Apr','May','Jun'}, [120 80 60; 132 90 70; 101 85 65; 134 95 80; 190 120 90; 230 140 110], 'Names', {'Email','Ads','Search'}); c.title('Channel traffic'); c.stack(); c.smooth(true); c.show();
%=============================================================================
