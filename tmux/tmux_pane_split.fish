#!/usr/bin/env fish

set current_pane (tmux display-message -p -F '#{pane_index}')
set pane_count (tmux list-panes | wc -l)

# if test "$pane_count" -eq 1
#     tmux split-window -h
# else
    # set left_most_pane (tmux list-panes -F '#{pane_left} #{pane_index}' | awk '$1==0 {print $2}' | head -n 1)
    set highest_index_pane (tmux list-panes -F '#{pane_index}' | sort -n | tail -1)

    # if test "$current_pane" = "$left_most_pane"
    #     tmux select-pane -t "$highest_index_pane"
    #     tmux split-window -v
    # else
        tmux select-pane -t "$pane_count"
        # tmux split-window -v
        tmux split-window
    # end
# end
