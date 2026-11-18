%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Tree: file system.
leaf = @(n) struct('name', n);
lv = @(n, v) struct('name', n, 'value', v);
br = @(n, k) struct('name', n, 'children', {k});
root = br('root', {br('home', {leaf('alice'), leaf('bob')}), br('etc', {leaf('hosts'), leaf('fstab')}), br('var', {br('log', {leaf('syslog')}), leaf('tmp')})});
echarts.tree(root).title('File system').show();
%=============================================================================
