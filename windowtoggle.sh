#!/bin/bash

#Set your monitor height and width here!
monitor_width=2560 
monitor_height=1440

active_window_id=$(xdotool getactivewindow)
is_fullscreen=$(xprop -id $active_window_id _NET_WM_STATE | grep '_NET_WM_STATE_FULLSCREEN')
if [ ! -z "$is_fullscreen" ]; then exit; fi

eval $(xdotool getwindowgeometry --shell $active_window_id)
if [ "$WIDTH" -eq $monitor_width ] && [ "$HEIGHT" -eq $monitor_height ]; then exit; fi

is_maximized=$(xprop -id $active_window_id _NET_WM_STATE | grep '_NET_WM_STATE_MAXIMIZED_VERT\|_NET_WM_STATE_MAXIMIZED_HORZ')
if [ ! -z "$is_maximized" ]; then wmctrl -ir $active_window_id -b remove,maximized_vert,maximized_horz; fi

current_monitor=$(( $X / $monitor_width ))
new_x=$(( current_monitor == 0 ? $X + $monitor_width : $X - $monitor_width ))

xdotool windowmove $active_window_id $new_x $Y
if [ ! -z "$is_maximized" ]; then wmctrl -ir $active_window_id -b add,maximized_vert,maximized_horz; fi
