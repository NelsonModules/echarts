%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% c = echarts.gauge(value)
% c = echarts.gauge(value, 'Min', lo, 'Max', hi, 'Name', label, 'Title', '...')
%   Create a gauge showing a single value on a dial. 'Min' and 'Max' set the
%   dial range (default 0 and 100); 'Name' labels the reading.
%
%   Example:
%     echarts.gauge(72, 'Name', 'SOC', 'Title', 'Battery').show();
function c = gauge(value, varargin)
  lo = 0;
  hi = 100;
  name = '';
  titleText = '';
  for k = 1:2:numel(varargin)
    switch lower(char(varargin{k}))
      case 'min'
        lo = double(varargin{k + 1});
      case 'max'
        hi = double(varargin{k + 1});
      case 'name'
        name = char(varargin{k + 1});
      case 'title'
        titleText = char(varargin{k + 1});
      otherwise
        error('echarts:gauge', 'Unknown option "%s".', char(varargin{k}));
    end
  end
  c = echarts.chart('gauge');
  c.option('legend.show', false);
  item = struct('value', double(value), 'name', name);
  c.addSeries({item}, 'min', lo, 'max', hi, ...
    'progress', struct('show', true), ...
    'detail', struct('valueAnimation', true, 'formatter', '{value}'));
  if ~isempty(titleText)
    c.title(titleText);
  end
end
%=============================================================================
