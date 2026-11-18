%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Bar chart: votes by district.
echarts.bar({'North','South','East','West','Center'}, [340 280 310 265 390], 'Names', {'Votes by district'}).title('Votes by district').ylabel('votes').show();
%=============================================================================
