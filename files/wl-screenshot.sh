#!/bin/sh
# Thanks, Stefan van der Walt!

notify-send 'screenshot' 'please select area'

mkdir -p /tmp/screenshots
grim -g "$(slurp)" "/tmp/screenshots/$(date '+%Y-%m-%d_%H:%M:%S.png')"

notify-send "screenshot saved to /tmp/screenshots/$(date '+%Y-%m-%d_%H:%M:%S'.png)"

echo "file:///tmp/screenshots/$(date '+%Y-%m-%d_%H:%M:%S'.png)" | wl-copy
