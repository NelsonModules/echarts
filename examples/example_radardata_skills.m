%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Radar chart: skill profile.
c = echarts.radar({'Coding','Design','Comm','Teamwork','Testing','Docs'}, [80 60 70 90 75 65; 60 85 80 70 65 90], 'Names', {'Alice','Bob'}); c.title('Skill profile'); c.Option.series{1}.areaStyle = struct('opacity', 0.15); c.show();
%=============================================================================
