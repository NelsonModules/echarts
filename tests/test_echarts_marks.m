%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% hline() and vline() add markLine items to the first series.
c = echarts.line({'a', 'b', 'c'}, [1 2 3]);
c.hline(2);
c.vline('b');
data = c.config().series{1}.markLine.data;
assert_isequal(numel(data), 2);
assert_isequal(data{1}.yAxis, 2);
assert_isequal(data{2}.xAxis, 'b');
%=============================================================================
% yregion() adds a markArea pair.
c = echarts.line({'a', 'b', 'c'}, [1 2 3]);
c.yregion(1, 2);
area = c.config().series{1}.markArea.data;
assert_isequal(numel(area), 1);
assert_isequal(area{1}{1}.yAxis, 1);
assert_isequal(area{1}{2}.yAxis, 2);
%=============================================================================
% markPoint() accepts a ready item.
c = echarts.line({'a', 'b'}, [1 2]);
c.markPoint(struct('coord', {{0, 1}}, 'value', 'peak'));
assert_istrue(isfield(c.config().series{1}, 'markPoint'));
%=============================================================================
% A mark without any series is an error.
c = echarts.chart('line');
assert_checkerror('c.hline(1)', 'Add a series before an annotation.');
%=============================================================================
