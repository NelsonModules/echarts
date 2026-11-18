%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Multi-series line: energy sources.
c = echarts.line({'Jan','Feb','Mar','Apr','May','Jun'}, [30 20 10; 32 22 12; 28 25 14; 34 24 16; 36 28 18; 38 30 20], 'Names', {'Gas','Solar','Wind'}); c.title('Energy sources'); c.stack(); c.smooth(true); c.show();
%=============================================================================
