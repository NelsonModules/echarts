%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Sankey: web funnel flow.
echarts.sankey({'Home','Home','Product','Product','Cart'}, {'Product','Exit','Cart','Exit','Checkout'}, [600 200 300 300 180]).title('Web funnel flow').show();
%=============================================================================
