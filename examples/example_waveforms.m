%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Oscilloscope-style display: six signal channels drawn as stacked waveform
% traces over a dark grid. Nelson computes every sample of the signals (one
% seamless period in buf); an in-page requestAnimationFrame loop (c.OnReady)
% only slides a reading window along that Nelson data, so the traces stream
% smoothly at the display refresh rate (~60 FPS) with no signal math in the page.
names = {'sine', 'AM', 'FM', 'square', 'burst', 'sawtooth'};
colors = {'#36d1dc', '#a6ff00', '#ffb020', '#ff5c8a', '#c792ea', '#eaeaea'};
step = 3.2;
fs = 100;             % samples per second: one sample every 10 ms
win = 1000;           % samples in the visible window (ten seconds)
tWin = (win - 1) / fs;
tBuf = 20;            % buffer length: every frequency closes a whole number of
Lbuf = fs * tBuf;     % cycles over 20 s, so the scroll loops seamlessly.
tb = (0:Lbuf - 1) / fs;
burst = tb - 0.5 * floor(tb / 0.5);
buf = zeros(6, Lbuf);
buf(1, :) = sin(2 * pi * 5 * tb);
buf(2, :) = (1 + 0.5 * sin(2 * pi * 1 * tb)) .* sin(2 * pi * 9 * tb);
buf(3, :) = sin(2 * pi * 6 * tb + 3 * sin(2 * pi * 0.75 * tb));
buf(4, :) = 0.9 * sign(sin(2 * pi * 4 * tb));
buf(5, :) = 2.2 * exp(-6 * burst) .* sin(2 * pi * 14 * burst);
buf(6, :) = 0.9 * (2 * (4 * tb - floor(0.5 + 4 * tb)));
% First visible frame (and the fallback when scripting is off): the first window.
xw = (0:win - 1) / fs;
series = cell(1, 6);
for k = 1:6
  baseline = (6 - k) * step;
  s = struct('type', 'line', 'name', names{k}, 'showSymbol', false, ...
    'smooth', false, 'lineStyle', struct('width', 1.3, 'color', colors{k}), ...
    'emphasis', struct('disabled', true));
  s.data = [xw(:), (buf(k, 1:win) + baseline).'];
  series{k} = s;
end
opt = struct();
opt.backgroundColor = '#0b0f14';
opt.animation = false;
opt.title = struct('text', 'Waveforms', 'left', 'center', ...
  'textStyle', struct('color', '#eaeaea'));
opt.legend = struct('top', 28, 'textStyle', struct('color', '#9aa7b4'));
opt.tooltip = struct('show', false);
opt.grid = struct('left', 48, 'right', 24, 'top', 72, 'bottom', 44);
opt.xAxis = struct('type', 'value', 'min', 0, 'max', tWin, 'name', 'time (s)', ...
  'nameTextStyle', struct('color', '#9aa7b4'), ...
  'axisLine', struct('lineStyle', struct('color', '#2a3644')), ...
  'axisLabel', struct('color', '#9aa7b4'), ...
  'splitLine', struct('show', true, 'lineStyle', struct('color', '#141b24')));
opt.yAxis = struct('type', 'value', 'show', false, ...
  'min', -step, 'max', 6 * step, ...
  'splitLine', struct('show', true, 'lineStyle', struct('color', '#141b24')));
opt.series = series;
c = echarts.fromOption(opt);
% The page receives Nelson's samples (buf) and every frame slides the window by
% a few samples, reading the values straight out of buf -- no signal is computed
% in the browser, only the offset advances.
c.OnReady = [ ...
  'var buf = ', jsonencode(buf), ';', newline, ...
  'var N = ', int2str(win), ', fs = ', int2str(fs), ', step = ', num2str(step), ';', newline, ...
  'var L = buf[0].length, off = 0, speed = 150, last = performance.now();', newline, ...
  'function frame(now){', newline, ...
  '  var dt = (now - last) / 1000; last = now; off = (off + dt * speed) % L;', newline, ...
  '  var series = [];', newline, ...
  '  for (var k = 0; k < 6; k++){', newline, ...
  '    var base = (5 - k) * step, row = buf[k], data = new Array(N);', newline, ...
  '    for (var i = 0; i < N; i++){ var idx = (off + i) % L; data[i] = [i/fs, row[idx | 0] + base]; }', newline, ...
  '    series.push({ data: data });', newline, ...
  '  }', newline, ...
  '  chart.setOption({ series: series }, { lazyUpdate: true });', newline, ...
  '  requestAnimationFrame(frame);', newline, ...
  '}', newline, ...
  'requestAnimationFrame(frame);'];
c.show();
%=============================================================================
