theme: with theme; {
  manager = {
    hovered = {
      bg = "#${cursor_line}";
    };
    preview_hovered = { };

    find_keyword = {
      reversed = true;
    };

    count_copied = {
      fg = "#${background}";
      bg = "#${green}";
      bold = true;
    };
    count_cut = {
      fg = "#${background}";
      bg = "#${red}";
      bold = true;
    };
    count_selected = {
      fg = "#${background}";
      bg = "#${yellow}";
      bold = true;
    };

    border_style = {
      fg = "#${border}";
    };
  };
  status = {
    separator_open = "";
    separator_close = "";
    separator_style = {
      fg = "#${surface0}";
      bg = "#${surface0}";
    };

    mode_normal = {
      fg = "#${background}";
      bg = "#${blue}";
      bold = true;
    };

    progress_normal = {
      fg = "#${blue}";
      bg = "#${surface0}";
    };
    progress_error = {
      fg = "#${error}";
      bg = "#${surface0}";
    };

    owner_user = {
      fg = "#${mauve}";
    };
    owner_group = {
      fg = "#${mauve}";
    };
    owner_seperator = {
      fg = "#${secondary_text}";
    };

    permissions_t = {
      fg = "#${secondary_text}";
    };
    permissions_s = {
      fg = "#${secondary_text}";
    };
    permissions_r = {
      fg = "#${green}";
    };
    permissions_w = {
      fg = "#${yellow}";
    };
    permissions_x = {
      fg = "#${red}";
    };
  };
  select = {
    active = {
      reversed = true;
    };
  };
  completion = {
    active = {
      bg = "#${cursor_line}";
    };
  };
  which = {
    cand = {
      fg = "#${blue}";
    };
    desc = {
      fg = "#${text}";
    };
    separator = "  ";
    separator_style = {
      fg = "#${text}";
    };
  };
  help = {
    hovered = {
      bg = "#${cursor_line}";
    };
    footer = {
      bg = "#${background}";
    };
  };
  icon =
    let
      image = "󰋩";
    in
    {
      dirs = [
        {
          name = ".config";
          text = "";
        }
        {
          name = "Documents";
          text = "󰈙";
        }
        {
          name = "Downloads";
          text = "󰉍";
        }
        {
          name = "Pictures";
          text = "󰉏";
        }
      ];
      files = import ./theme-files.nix;
      exts = import ./theme-exts.nix;
      conds = [
        {
          "if" = "dir";
          text = "󰉋";
        }
        {
          "if" = "link";
          text = "";
        }
        {
          "if" = "orphan";
          text = "";
        }
        {
          "if" = "hidden";
          text = "";
        }
        {
          "if" = "!dir";
          text = "󰈔";
        }
      ];
    };
}
