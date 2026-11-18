%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% A world choropleth map shaded by a per-country value (bundled world map).
countries = {'France', 'Germany', 'China', 'India', 'Brazil', ...
  'United States of America', 'Australia', 'Canada', 'Egypt'};
values = [55 48 92 78 40 88 25 32 20];
echarts.choropleth(countries, values).title('Index by country').show();
%=============================================================================
