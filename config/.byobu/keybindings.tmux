set -g prefix F12
unbind-key -n C-a

bind-key -n M-F1 display-panes \; split-window -v -c "#{pane_current_path}"
bind-key -n C-F1 display-panes \; split-window -h -c "#{pane_current_path}"
bind-key -n F1 new-window -c "#{pane_current_path}" \; rename-window "-"
bind-key -n F2 previous-window
bind-key -n F3 next-window

