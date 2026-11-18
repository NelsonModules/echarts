%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Horizontal bar chart: language popularity.
echarts.bar({'Rust','Go','Python','C++','Java','JS'}, [92 78 88 95 70 83], 'Names', {'Language popularity'}).horizontal().title('Language popularity').dataLabels('right').show();
%=============================================================================
