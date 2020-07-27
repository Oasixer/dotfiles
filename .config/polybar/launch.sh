#!/usr/bin/env sh


## Add this to your wm startup file.
export DEFAULT_NETWORK_INTERFACE=$(ip link | grep '^default' | awk '{print $5}' | head -n1)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# polybar -c ~/.config/polybar/config.ini main &

if hostnamectl | grep -q 'laptop'; then
    CONFIG=config_laptop.ini
else
    CONFIG=config_desktop.ini
fi

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload main -c ~/.config/polybar/$CONFIG &
done
