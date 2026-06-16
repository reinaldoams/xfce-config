#!/bin/bash

# Define your display names here
SCREEN1="eDP-1"
SCREEN2="HDMI-1"
SCREEN2_MODE="2560x1440"
SCREEN2_RATE="144"

# Check if the second screen is currently enabled (has an active mode)
if xrandr | grep "^$SCREEN2 connected" | grep -q "[0-9]\+x[0-9]\+"; then
    # HDMI active -> enable laptop screen first, then turn HDMI off
    xrandr --output "$SCREEN1" --auto --primary --output "$SCREEN2" --off
else
    # HDMI inactive -> enable external monitor first, then turn laptop screen off
    xrandr --output "$SCREEN2" --mode "$SCREEN2_MODE" --rate "$SCREEN2_RATE" --primary --output "$SCREEN1" --off
fi

# Pause briefly for the X server to finish mapping the new display
sleep 1

# Kill any lingering gammastep instances, reset the gamma ramps, and run your config
killall gammastep 2>/dev/null
gammastep -P -O 3000 &
