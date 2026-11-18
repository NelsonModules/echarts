%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% writeTextFile(filename, text)
%   Write a character string to a text file, replacing any existing content.
function writeTextFile(filename, text)
  fid = fopen(filename, 'wt');
  if fid == -1
    error('echarts:write', 'Cannot open "%s" for writing.', char(filename));
  end
  cleaner = onCleanup(@() fclose(fid));
  fprintf(fid, '%s', text);
end
%=============================================================================
