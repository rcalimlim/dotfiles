#!/bin/bash

#------------------------------------------------------------------------------
# Weather applet for zellij pane
#------------------------------------------------------------------------------

# TODO: get location dynamically on startup

# position=$(curl -s ipinfo.io | jq -r '.loc')
# latitude=$(echo "$position" | awk -F ',' '{print $1}')
# longitude=$(echo "$position" | awk -F ',' '{print $2}')

wego | head -n 7
