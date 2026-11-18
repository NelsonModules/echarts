%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bar chart: revenue by product.
echarts.bar({'Pro','Team','Free','Edu','Gov'}, [540 320 90 60 110], 'Names', {'Revenue by product'}).title('Revenue by product').ylabel('k EUR').show();
%=============================================================================
