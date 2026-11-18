%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A lines chart: several polylines with an animated trail.
t = linspace(0, 2 * pi, 120).';
orbits = {[cos(t) sin(t)], [2 * cos(t) 2 * sin(t)], [3 * cos(t) 3 * sin(t)]};
echarts.lines(orbits).title('Orbits').show();
%=============================================================================
