#!/bin/bash
#
# This script generates a TerriaJS init file when executed.
# It does this so that we can edit the feature info template with newlines,
# and it is then condensed to a single line.
#

tr -d '\n' > ls57_reflectance-chart.json <<EOF
"template": "
<table>
  <tr><td><b>Time</b></td><td>{{time}}</td></tr>
  <tr><td><b>Blue - 490</b></td><td>{{bands.blue}}</td></tr>
  <tr><td><b>Green - 560</b></td><td>{{bands.green}}</td></tr>
  <tr><td><b>Red - 660</b></td><td>{{bands.red}}</td></tr>
  <tr><td><b>Near Infrared (NIR) - 840</b></td><td>{{bands.nir}}</td></tr>
  <tr><td><b>Shortwave Infrared (SWIR) - 1650</b></td><td>{{bands.swir1}}</td></tr>
  <tr><td><b>Shortwave Infrared (SWIR) - 2220</b></td><td>{{bands.swir2}}</td></tr>
  <tr><td><b>NDVI - Red, NIR</b></td><td>{{band_derived.ndvi}}</td></tr>
  <tr><td><b>NDWI - Green, SWIR</b></td><td>{{band_derived.ndwi}}</td></tr>
</table>

<p>
<chart id='{{lat}}{{lon}}{{time}}'
 title='NBART at {{lat}},{{lon}}'
 column-units='Wavelength (nm), Reflectance x 10k'
 preview-x-label='NBART Reflectance'
>nm,NBART Reflectance\n
490,{{bands.blue}}\n
560,{{bands.green}}\n
660,{{bands.red}}\n
840,{{bands.nir}}\n
1650,{{bands.swir1}}\n
2220,{{bands.swir2}}
</chart>
</p>

<p>
<b>Imagery available for dates:</b>
{{#data_available_for_dates}}
<br/>{{.}}
{{/data_available_for_dates}}
</p>"
EOF
