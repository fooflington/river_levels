DATAPATH=/var/lib/munin/localdomain
OUTPATH=~/public_html

rrdtool graph $OUTPATH/river-canterbury.png \
  --end now --start end-4w \
  --height 400 --width 1200 \
  DEF:r17_1135=$DATAPATH/localhost.localdomain-river_levels_17-river_level_1135-g.rrd:42:AVERAGE \
  DEF:r17_1143=$DATAPATH/localhost.localdomain-river_levels_17-river_level_1143-g.rrd:42:AVERAGE \
  LINE1:r17_1135#0000FF:"Stour at Chartham (1135)\l" \
  LINE1:r17_1143#00FF00:"Stour at Vauxhall Bridge (1143)\l" \
  HRULE:0.8#000000 \
  >/dev/null
