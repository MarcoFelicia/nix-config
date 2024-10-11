{ lib, config, ... }:
with builtins;
with lib;
let
  mkSetOption =
    set:
    mapAttrs (
      name: value:
      if typeOf value == "string" then
        mkOption { type = types.str; }
      else
        mkOption { type = types.${typeOf value}; }
    ) set;

  theme = rec {
    paletteName = "Catppuccin Frappe";
    flamingo = "eebebe";
    pink = "f4b8e4";
    mauve = "ca9ee6";
    red = "e78284";
    maroon = "ea999c";
    peach = "ef9f76";
    yellow = "e5c890";
    green = "a6d189";
    teal = "81c8be";
    sky = "99d1db";
    sapphire = "85c1dc";
    blue = "8caaee";
    lavender = "babbf1";
    text = "c6d0f5";
    subtext1 = "b5bfe2";
    subtext0 = "a5adce";
    overlay2 = "949cbb";
    overlay1 = "838ba7";
    overlay0 = "737994";
    surface2 = "626880";
    surface1 = "51576d";
    surface0 = "414559";
    base = "303446";
    mantle = "292c3c";
    crust = "232634";

    primary = blue;
    background = base;
    secondary_panel = mantle;
    border = overlay0;
    shadow = crust;

    secondary_text = subtext1;
    disabled_text = subtext0;
    placeholder_text = subtext0;

    button = surface0;
    input = surface0;

    hover = overlay2;
    hover_opacity = 0.3;

    selected = primary;
    selected_text = background;

    disabled_opacity = 0.7;

    status_bar = secondary_panel;
    menu = background;
    osd = status_bar;
    app_launcher = secondary_panel;

    progress_trough = surface1;
    progress_highlight = primary;

    keyword = mauve;
    strings = green;
    symbols = red;
    escape_regex = pink;
    comments = overlay2;
    constants_numbers = peach;
    operators = sky;
    braces_delimiters = overlay2;
    functions = blue;
    parameters = maroon;
    builtins = red;
    classes_types = yellow;
    enum = teal;
    property = blue;
    attributes = yellow;

    cursor_line = surface0;
    url_link = blue;
    error = red;
    warning = yellow;
    info = teal;

    window_border = 2;
    window_gaps = 2;
    window_padding = 4;
    window_rounding = 8;

    opacity = 0.9;
  };
in
{
  options.custom = {
    theme = mkSetOption theme;
  };
  config.custom = {
    inherit theme;
  };
}
