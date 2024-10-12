#!/bin/bash

# Check if any window is selected and exit if none
active_window_id=$(xdotool getactivewindow)
[ -z "$active_window_id" ] && exit

# Check if the active window is in fullscreen mode and exit if it is
xprop -id "$active_window_id" _NET_WM_STATE | grep -q '_NET_WM_STATE_FULLSCREEN' && exit

# Get the X position of the current window
window_x=$(xdotool getwindowgeometry --shell "$active_window_id" | grep "^X=" | cut -d'=' -f2)

# Determine the current monitor by dividing the X position by the monitor width
monitor_width=2560  # Set your monitor width here
current_monitor=$(( window_x / monitor_width ))

# Use xdotool to move the window to the other monitor
xdotool keydown Super
if [ $current_monitor -eq 0 ]; then
    xdotool key Right
else
    xdotool key Left
fi
xdotool keyup Super
