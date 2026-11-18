%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series bar: defects by phase.
c = echarts.bar({'Design','Build','Test','Ship'}, [5 2; 12 8; 20 15; 4 9], 'Names', {'Major','Minor'}); c.title('Defects by phase'); c.stack(); c.show();
%=============================================================================
