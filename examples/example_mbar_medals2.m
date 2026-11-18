%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series bar: medals by type.
c = echarts.bar({'USA','China','Japan','UK'}, [39 41 33; 37 32 18; 27 14 17; 22 20 22], 'Names', {'Gold','Silver','Bronze'}); c.title('Medals by type'); c.stack(); c.show();
%=============================================================================
