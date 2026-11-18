# World map data

- File: `world.json` (GeoJSON `FeatureCollection` of country polygons)
- Source: bundled from the Apache ECharts project map data
  (https://github.com/apache/echarts), used by `echarts.registerMap('world', ...)`.

The country geometry ultimately derives from public map data. For production use
with strict licensing requirements, verify the provenance of this file or replace
it with a map you control (any GeoJSON registered under the name `world` works).
