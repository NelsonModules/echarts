%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bar chart: monthly rainfall.
echarts.bar({'Jan','Feb','Mar','Apr','May','Jun'}, [49 38 55 72 61 44], 'Names', {'Monthly rainfall'}).title('Monthly rainfall').ylabel('mm').show();
%=============================================================================
