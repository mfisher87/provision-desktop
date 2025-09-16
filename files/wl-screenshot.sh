#!/bin/sh
# Thanks, Stefan van der Walt!

notify-send 'screenshot' 'please select area'

mkdir -p /tmp/screenshots
FN="/tmp/screenshots/$(date '+%Y-%m-%d_%H:%M:%S.png')"

grim -g "$(slurp)" "${FN}"
notify-send "screenshot saved to ${FN}"

cat "${FN}" | wl-copy --type image/png
