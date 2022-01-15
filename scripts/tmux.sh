#!/bin/bash

SESSION="main"
WINDOW_A="edit"
WINDOW_B="cmd"
tmux has-session -t $SESSION &> /dev/null

if [ $? != 0 ]
 then
    tmux new-session -s $SESSION -n $WINDOW_A -d
    tmux new-window -t $SESSION -n $WINDOW_B
    tmux split-window -h -p 50 -t $WINDOW_B
fi

tmux select-window -t $SESSION:$WINDOW_A \; a -t $SESSION
