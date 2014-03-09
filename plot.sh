DATAPATH=/var/lib/munin/localdomain
OUTPATH=~/public_html
ATTR="Contains Environment Agency information (C) Environment Agency and database right"

rrdtool graph $OUTPATH/river-canterbury.png \
  -t 'Great Stour at Canterbury' \
  -v 'm' \
  --end now --start end-6w \
  --height 400 --width 1200 \
  DEF:r17_1135=$DATAPATH/localhost.localdomain-river_levels_17-river_level_1135-g.rrd:42:AVERAGE \
  DEF:r17_1143=$DATAPATH/localhost.localdomain-river_levels_17-river_level_1143-g.rrd:42:AVERAGE \
  DEF:r17_1145=$DATAPATH/localhost.localdomain-river_levels_17-river_level_1145-g.rrd:42:AVERAGE \
  LINE1:r17_1135#0000FF:"Stour at Chartham (1135)\l" \
  LINE1:r17_1143#FF0000:"Stour at Vauxhall Bridge (1143)\l" \
  LINE1:r17_1145#00FF00:"Stour at Wye (1145)\l" \
  COMMENT:"Last updated\: $(date|sed 's/:/\\:/g')\r" \
  -W "$ATTR" \
  -E \
  # HRULE:0.8#000000 \


rrdtool graph $OUTPATH/river-nailborne.png \
  -t 'Nailborne' \
  -v 'm' \
  --end now --start end-6w \
  --height 400 --width 1200 \
  DEF:r17_1131=$DATAPATH/localhost.localdomain-river_levels_17-river_level_1131-g.rrd:42:AVERAGE \
  DEF:r17_1139=$DATAPATH/localhost.localdomain-river_levels_17-river_level_1139-g.rrd:42:AVERAGE \
  LINE1:r17_1131#0000FF:"Bekesborne on Nailborne (1131)\l" \
  LINE1:r17_1139#FF0000:"Littleborne on Little Stour (1139)\l" \
  COMMENT:"Last updated\: $(date|sed 's/:/\\:/g')\r" \
  -W "$ATTR" \
  -E
