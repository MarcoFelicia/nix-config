config: {
  font_family = "Cascadia Code NF";
  bold_font = "Cascadia Mono NF Bold";
  italic_font = "Cascadia Mono NF Italic";
  bold_italic_font = "Cascadia Mono NF Bold Italic";
  font_size = 13;
  disable_ligatures = "always";
  undercurl_style = "thick-sparse";

  curosr_shape = "beam";
  cursor_shape_unfocused = "beam";
  cursor_blink_interval = "0.5";
  cursor_stop_blinking_after = 0;

  scrollback_lines = 10000;
  scrollback_indicator_opacity = 0;
  scrollback_pager = "bat";
  scrollback_fill_enlarged_window = true;

  mouse_hide_wait = 0;
  strip_trailing_spaces = "smart";
  clear_all_mouse_actions = true;

  repaint_delay = 16;

  enable_audio_bell = false;

  remember_window_size = false;
  confirm_os_window_close = 0;

  clipboard_control = "write-clipboard, read-clipboard";

  notify_on_cmd_finish = "unfocused 10";
  clear_all_shortcuts = true;

  shell = config.custom.defaultShellCommand;
}
