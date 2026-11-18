%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the echarts module for Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% Live variant of the waveforms oscilloscope: here Nelson computes every sample
% in the loop and pushes it to the chart (c.append), so the signal math runs in
% Nelson rather than in the page. The WebView / WebAssembly desktop embeds the
% chart and refreshes in place with a sliding window (MaxPoints); on the Qt or
% terminal display it shows the final window instead. The browser-animated,
% 60 FPS version is example_waveforms.m.
names = {'sine', 'AM', 'FM', 'square', 'burst', 'sawtooth'};
colors = {'#36d1dc', '#a6ff00', '#ffb020', '#ff5c8a', '#c792ea', '#eaeaea'};
step = 3.2;
fs = 100;                       % 100 Hz: one sample every 10 ms
win = 100;                      % sliding window width (one second)
baselines = ((6 - (1:6)) * step).';
% Prime a FULL window (win samples) so the display scrolls from the first append
% instead of growing; every sample is computed in Nelson.
n0 = 1:win;
t0 = n0 / fs;
b0 = t0 - 0.5 * floor(t0 / 0.5);
init = [sin(2 * pi * 5 * t0); ...
        (1 + 0.5 * sin(2 * pi * 1 * t0)) .* sin(2 * pi * 9 * t0); ...
        sin(2 * pi * 6 * t0 + 3 * sin(2 * pi * 0.75 * t0)); ...
        0.9 * sign(sin(2 * pi * 4 * t0)); ...
        2.2 * exp(-6 * b0) .* sin(2 * pi * 14 * b0); ...
        0.9 * (2 * (4 * t0 - floor(0.5 + 4 * t0)))] + baselines;
c = echarts.chart('line');
c.option('backgroundColor', '#0b0f14');
c.option('animation', false);
c.title('Waveforms (live)');
c.option('legend', struct('top', 28, 'textStyle', struct('color', '#9aa7b4')));
c.option('tooltip.show', false);
c.option('grid', struct('left', 48, 'right', 24, 'top', 72, 'bottom', 44));
c.labels(n0);
c.option('xAxis.name', 'sample');
c.option('xAxis.axisLine', struct('lineStyle', struct('color', '#2a3644')));
c.option('xAxis.axisLabel', struct('color', '#9aa7b4'));
c.option('xAxis.splitLine', struct('show', true, 'lineStyle', struct('color', '#141b24')));
c.option('yAxis', struct('type', 'value', 'show', false, ...
  'min', -step, 'max', 6 * step, ...
  'splitLine', struct('show', true, 'lineStyle', struct('color', '#141b24'))));
for k = 1:6
  c.addSeries(init(k, :), 'name', names{k}, 'showSymbol', false, ...
    'smooth', false, 'emphasis', struct('disabled', true), ...
    'lineStyle', struct('width', 1.3, 'color', colors{k}));
end
c.MaxPoints = win;
c.show();
% Stream: Nelson computes each new sample set beyond the primed window and
% appends it; MaxPoints drops the oldest, so the whole wall scrolls left. The
% loop runs long enough to scroll through several windows (~15 s live).
for k = 21:520
  n = win + (k - 20);
  t = n / fs;
  b = t - 0.5 * floor(t / 0.5);
  v = [sin(2 * pi * 5 * t); ...
       (1 + 0.5 * sin(2 * pi * 1 * t)) * sin(2 * pi * 9 * t); ...
       sin(2 * pi * 6 * t + 3 * sin(2 * pi * 0.75 * t)); ...
       0.9 * sign(sin(2 * pi * 4 * t)); ...
       2.2 * exp(-6 * b) * sin(2 * pi * 14 * b); ...
       0.9 * (2 * (4 * t - floor(0.5 + 4 * t)))] + baselines;
  c.append(n, v);
  drawnow();
  sleep(0.01);
end
%=============================================================================
