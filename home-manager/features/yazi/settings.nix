{
  manager = {
    ratio = [
      1
      3
      2
    ];
    sort_by = "natural";
    sort_sensitive = true;
    sort_dir_first = true;
    linemode = "none";
    show_hidden = true;
    show_symlink = false;
    scrolloff = 2;
    mouse_events = [
      "click"
      "scroll"
      "drag"
    ];
    title_format = "Yazi:{cwd}";
  };
  preview = {
    image_filter = "lanczos3";
    image_quality = 90;
    sixel_fraction = 10;
  };
  opener = {
    open = [
      {
        run = "xdg-open \"$@\"";
        orphan = true;
        desc = "Open";
      }
    ];
    text = [
      {
        run = "codium \"$@\"";
        orphan = true;
        desc = "Open in VSCodium";
      }
    ];
  };
  open = {
    rules = [
      {
        name = "*";
        use = [
          "open"
          "text"
        ];
      }
    ];
  };
  input =
    let
      origin = "bottom-center";
      offset = [
        0
        1
        48
        3
      ];
    in
    {
      cursor_blink = true;

      cd_origin = origin;
      cd_offset = offset;

      create_origin = origin;
      create_offset = offset;

      filter_origin = origin;
      filter_offset = offset;

      search_origin = origin;
      search_offset = offset;
    };
  select = {
    open_offset = [
      0
      1
      24
      7
    ];
  };
  which = {
    sort_by = "key";
    sort_sensitive = false;
  };
}
