#!/usr/bin/env bash
PLUGIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
  get-tmux-option() {
    local option value default
    option="$1"
    default="$2"
    value="$(tmux show-option -gqv "$option")"

    if [ -n "$value" ]; then
      echo "$value"
    else
      echo "$default"
    fi
  }

  set() {
    local option=$1
    local value=$2
    tmux set-option -gq "$option" "$value"
  }

  setw() {
    local option=$1
    local value=$2
    tmux set-window-option -gq "$option" "$value"
  }

  local theme
  theme="$(get-tmux-option "@catppuccin_flavour" "mocha")"

  # NOTE: Pulling in the selected theme by the theme that's being set as local
  # variables.
  # sed -E 's/^(.+=)/local \1/' \
  #     > "${PLUGIN_DIR}/catppuccin-selected-theme.tmuxtheme" \
  #     < "${PLUGIN_DIR}/catppuccin-${theme}.tmuxtheme"
  #
  # source "${PLUGIN_DIR}/catppuccin-selected-theme.tmuxtheme"

# status
  set status "on"
  set status-interval 2
  set status-bg "${thm_bg}"
  set status-justify "left"

  # messages
  set message-style "fg=${thm_blue},bg=${thm_bg},align=centre"
  set message-command-style "fg=${thm_cyan},bg=${thm_gray},align=centre"

  # panes
  set pane-border-style "fg=${thm_gray}"
  set pane-active-border-style "fg=${thm_blue}"

  # windows
  set window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
  set window-status-separator ""
  set window-status-style "fg=${thm_fg},bg=${thm_bg},none"

  readonly show_directory_in_window_status="#[fg=$thm_bg,bg=$thm_blue]#I #[fg=$thm_blue,bg=$thm_gray] #W"
  readonly show_directory_in_window_status_current="#[fg=$thm_bg,bg=$thm_orange] #I #[fg=$thm_fg,bg=$thm_bg] #W"
  readonly show_window_in_window_status="#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_black4,bg=$thm_orange] #I · #W #[fg=$thm_black4,bg=$thm_orange]#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_orange,bg=$thm_bg] "
  readonly show_window_in_window_status_current_2="#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_magenta,bg=$thm_orange]   #T #[fg=$thm_magenta,bg=$thm_orange]#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_orange,bg=$thm_bg]"
  readonly show_tmux_name="#[fg=$thm_red,bg=$thm_bg] 󰿅  #S "
  readonly show_window_in_window_status_current="#[fg=$thm_blue,bg=$thm_bg]#[fg=$thm_bg,bg=$thm_blue]  #W #[fg=$thm_bg,bg=$thm_blue]#[fg=$thm_blue,bg=$thm_bg] #[fg=$thm_blue,bg=$thm_bg]"

  # Right column 1 by default shows the Window name.
  local right_column1=$

  # Right column 2 by default shows the current Session name.
  local right_column2=$show_session


  # Window status by default shows the current directory basename.
  #local window_status_format=$show_directory_in_window_status
  #local window_status_current_format=$show_directory_in_window_status_current
  local window_status_format=$show_window_in_window_status
  local window_status_current_format=$show_window_in_window_status_current

  # NOTE: With the @catppuccin_window_tabs_enabled set to on, we're going to
  # update the right_column1 and the window_status_* variables.
  if [[ "${wt_enabled}" == "on" ]]
  then
    right_column1=$show_directory
    window_status_format=$show_window_in_window_status
    window_status_current_format=$show_window_in_window_status_current
  fi

  set status-left "${show_tmux_name} "

  set status-right "${show_window_in_window_status_current_2}"

  setw window-status-format "${window_status_format}"
  setw window-status-current-format "${window_status_current_format}"

  # --------=== Modes
  #
  setw clock-mode-colour "${thm_blue}"
  setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"
}

main "$@"
