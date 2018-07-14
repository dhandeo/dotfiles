#!/bin/sh
#
# Setup a work space called `work` with two windows
# first window has 3 panes.
# The first pane set at 65%, split horizontally, set to api root and running vim
# pane 2 is split at 25% and running redis-server
# pane 3 is set to api root and bash prompt.
# note: `api` aliased to `cd ~/path/to/work`
#
session="poise"

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n "notebook"

# Select pane 1
tmux selectp -t 1
tmux send-keys "cd projects" C-m
tmux send-keys "source ~/miniconda2/bin/activate" C-m
tmux send-keys "jupyter notebook" C-m

tmux new-window -n "python"

# Select pane 1
tmux selectp -t 2
tmux send-keys "cd projects" C-m
tmux send-keys "source ~/miniconda2/bin/activate" C-m

## Split pane 1 horizontal by 65%, start redis-server
#tmux splitw -h -p 35
#tmux send-keys "redis-server" C-m 
#
## Select pane 2 
#tmux selectp -t 2
## Split pane 2 vertiacally by 25%
#tmux splitw -v -p 75
#
## select pane 3, set to api root
#tmux selectp -t 3
#tmux send-keys "api" C-m 
#
## Select pane 1
#tmux selectp -t 1
#
## create a new window called scratch
#tmux new-window -t $session:1 -n scratch
#
## return to main vim window
#tmux select-window -t $session:0
#

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
