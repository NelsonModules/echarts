%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Radar chart: product scores.
c = echarts.radar({'Price','Quality','Design','Support','Features'}, [7 9 8 6 9; 9 6 7 8 6], 'Names', {'Pro','Lite'}); c.title('Product scores'); c.Option.series{1}.areaStyle = struct('opacity', 0.15); c.show();
%=============================================================================
