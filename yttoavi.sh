#!/bin/bash
# 20-30 vids are maximum, depends on your internet connection and processor power

while read p; do
  youtube-dl -t $p &
done < linkovi
wait

for f in *.flv
do
ffmpeg -i $f -vcodec mpeg4 -target pal-vcd -r 25 -s 480x234 $f.avi &
done
wait

echo "DONE...............";
