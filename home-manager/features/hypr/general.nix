style: with style; {
  general = {
    border_size = window_border;
    gaps_in = window_gaps;
    gaps_out = window_padding;

    "col.active_border" = "rgb(${primary})";
    "col.inactive_border" = "rgb(${border})";

    resize_on_border = true;
    extend_border_grab_area = window_gaps;
    hover_icon_on_border = false;

    layout = "master";
  };

  decoration = {
    rounding = window_rounding;
    active_opacity = opacity;
    inactive_opacity = opacity - 3.0e-2;

    "col.shadow" = "rgba(00000000)";

    blur = {
      enabled = true;
      noise = 0.0;
      popups = true;
      popups_ignorealpha = opacity - 0.1;
    };
  };

  master = {
    mfact = 0.55;
  };

  input = {
    kb_model = "pc104";
    kb_layout = "us";
    repeat_rate = 32;
    repeat_delay = 200;
    follow_mouse = 2;
    float_switch_override_focus = 0;
  };

  binds = {
    scroll_event_delay = 100;
    allow_workspace_cycles = true;
    workspace_center_on = 1;
  };

  cursor = {
    inactive_timeout = 20;
    persistent_warps = true;
  };

  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
    middle_click_paste = false;
  };
}
