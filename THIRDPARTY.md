# Third-party components

This module bundles the following third-party software, under `thirdparty/`, so
that charts render offline with no network access. Each library keeps its own
license, stored next to the bundled file.

## Apache ECharts (core)

- Version: 5.6.0 - https://echarts.apache.org - Apache-2.0
- Bundled: `thirdparty/echarts.min.js`
- License: `thirdparty/LICENSE.echarts.txt`

The ECharts core bundle already provides every built-in chart type (line, bar,
pie, scatter, radar, heatmap, boxplot, candlestick, graph, tree, treemap,
sunburst, sankey, funnel, gauge, parallel, themeRiver, map, ...). The module can
also load ECharts from a CDN or a custom URL (see the `Library` option).

## Extensions (optional add-ons)

Bundled under `thirdparty/plugins/`, each with a `LICENSE.<name>.txt` file.

| File | Package | Version | License | Powers |
| --- | --- | --- | --- | --- |
| echarts-wordcloud.min.js | echarts-wordcloud | 2.1.0 | ISC | `echarts.wordcloud` |
| echarts-gl.min.js | echarts-gl | 2.0.9 | BSD-3-Clause | `echarts.surface`, `bar3D`, `scatter3D`, `line3D` |

`echarts.vendor(name)` re-downloads any of them for offline use.

## World map data

- File: `thirdparty/maps/world.json` (GeoJSON)
- Used by `echarts.choropleth` so world maps render offline.
- License / provenance: see `thirdparty/maps/LICENSE.world.md`.
