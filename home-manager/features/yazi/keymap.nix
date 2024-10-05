let
  keymaps = {
    manager = [
      # escape
      {
        on = "<Esc>";
        run = [
          "escape --all"
          "unyank"
        ];
        desc = "Exit visual mode; clear selected; cancel search; cancel yank status";
      }
      {
        on = "<C-q>";
        run = "quit";
        desc = "Quit Yazi";
      }
      # scroll
      {
        on = "<Up>";
        run = "plugin --sync arrow --args=-1";
        desc = "Move cursor up";
      }
      {
        on = "<Down>";
        run = "plugin --sync arrow --args=1";
        desc = "Move cursor down";
      }
      {
        on = "<PageUp>";
        run = "arrow -100%";
        desc = "Move cursor up one page";
      }
      {
        on = "<PageDown>";
        run = "arrow 100%";
        desc = "Move cursor down one page";
      }
      {
        on = "<C-Home>";
        run = "arrow -9999999";
        desc = "Move cursor to the top";
      }
      {
        on = "<C-End>";
        run = "arrow 9999999";
        desc = "Move cursor to the bottom";
      }
      # navigate
      {
        on = "<Left>";
        run = [
          "escape --select"
          "leave"
        ];
        desc = "Go back to the parent directory";
      }
      {
        on = "<Right>";
        run = [
          "escape --select"
          "enter"
        ];
        desc = "Enter the child directory or open the file";
      }
      {
        on = "<A-Left>";
        run = [
          "escape --select"
          "back"
        ];
        desc = "Go back to the previous directory";
      }
      {
        on = "<A-Right>";
        run = [
          "escape --select"
          "forward"
        ];
        desc = "Go forward to the next directory";
      }
      # preview
      {
        on = "<A-Up>";
        run = "seek -1";
        desc = "Move cursor up in the preview";
      }
      {
        on = "<A-Down>";
        run = "seek 1";
        desc = "Move cursor down in the preview";
      }
      # cd
      {
        on = "d";
        run = "cd --interactive";
        desc = "Go to a directory interactively";
      }
      # bookmark
      {
        on = [
          "b"
          "a"
        ];
        run = "plugin yamb --args=save";
        desc = "Add bookmark";
      }
      {
        on = [
          "b"
          "<Right>"
        ];
        run = "plugin yamb --args=jump_by_key";
        desc = "Jump bookmark by key";
      }
      {
        on = [
          "b"
          "<Delete>"
        ];
        run = "plugin yamb --args=delete_by_key";
        desc = "Delete bookmark by key";
      }
      {
        on = [
          "b"
          "<C-Delete>"
        ];
        run = "plugin yamb --args=delete_all";
        desc = "Delete all bookmarks";
      }
      {
        on = [
          "b"
          "<F2>"
        ];
        run = "plugin yamb --args=rename_by_key";
        desc = "Rename bookmark by key";
      }
      # select
      {
        on = "<Space>";
        run = "select";
        desc = "Toggle the current selection state";
      }
      {
        on = "<Tab>";
        run = [
          "select"
          "arrow 1"
        ];
        desc = "Toggle the current selection state and move cursor down";
      }
      {
        on = "<C-Tab>";
        run = [
          "arrow -1"
          "select"
        ];
        desc = "Toggle the current selection state and move cursor up";
      }
      {
        on = "a";
        run = "select_all --state=true";
        desc = "Select all files";
      }
      # open
      {
        on = "<Enter>";
        run = "open";
        desc = "Open selected files with default application";
      }
      {
        on = "<S-Enter>";
        run = "open --interactive";
        desc = "Open selected files interactively";
      }
      # clipboard
      {
        on = "y";
        run = [
          ''
            shell 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list' --confirm
          ''
          "yank"
        ];
        desc = "Yank selected files";
      }
      {
        on = "x";
        run = "yank --cut";
        desc = "Cut selected files";
      }
      {
        on = "p";
        run = "plugin --sync smart-paste";
        desc = "Paste yanked files into the hovered directory or CWD";
      }
      # delete
      {
        on = "<Delete>";
        run = "remove";
        desc = "Move selected files to trash";
      }
      {
        on = "<S-Delete>";
        run = "remove --permanently";
        desc = "Permanently delete selected files";
      }
      # create
      {
        on = "<n>";
        run = "create";
        desc = "Create new file/directory";
      }
      # rename
      {
        on = "<F2>";
        run = "rename --cursor=before_ext";
        desc = "Rename selected file(s)";
      }
      # copy
      {
        on = [
          "c"
          "p"
        ];
        run = "copy path";
        desc = "Copy the file path";
      }
      {
        on = [
          "c"
          "d"
        ];
        run = "copy dirname";
        desc = "Copy the directory path";
      }
      {
        on = [
          "c"
          "f"
        ];
        run = "copy filename";
        desc = "Copy the filename";
      }
      {
        on = [
          "c"
          "x"
        ];
        run = "copy name_without_ext";
        desc = "Copy the filename without extension";
      }
      # hidden
      {
        on = ".";
        run = "hidden";
        desc = "Toggle the visibility of hidden files";
      }
      # linemode
      {
        on = [
          ","
          "n"
        ];
        run = [
          "sort natural"
          "linemode none"
        ];
        desc = "Disable linemode";
      }
      {
        on = [
          ","
          "s"
        ];
        run = [
          "sort size"
          "linemode size"
        ];
        desc = "Set linemode to size";
      }
      {
        on = [
          ","
          "c"
        ];
        run = [
          "sort created"
          "linemode ctime"
        ];
        desc = "Set linemode to creation time";
      }
      {
        on = [
          ","
          "m"
        ];
        run = [
          "sort modified"
          "linemode mtime"
        ];
        desc = "Set linemode to modified time";
      }
      {
        on = [
          ","
          "p"
        ];
        run = "linemode permissions";
        desc = "Set linemode to permissions";
      }
      {
        on = [
          ","
          "o"
        ];
        run = "linemode owner";
        desc = "Set linemode to owner";
      }
      # reverse sort
      {
        on = [
          ","
          "r"
        ];
        run = "sort --reverse";
        desc = "Reverse sort";
      }
      {
        on = [
          ","
          "R"
        ];
        run = "sort --reverse=no";
        desc = "Disable reverse sort";
      }
      # search
      {
        on = "?";
        run = "search fd --args='-H'";
        desc = "Global Search";
      }
      # filter
      {
        on = "/";
        run = "filter --smart";
        desc = "filter current directory";
      }
      # task manager
      {
        on = "t";
        run = "tasks_show";
        desc = "Show the task manager";
      }
    ];
    tasks = [
      {
        on = "<Esc>";
        run = "close";
        desc = "Close the task manager";
      }
      {
        on = "<Up>";
        run = "arrow -1";
        desc = "Next task";
      }
      {
        on = "<Down>";
        run = "arrow 1";
        desc = "Previous task";
      }
      {
        on = "<Enter>";
        run = "inspect";
        desc = "inspect the task";
      }
      {
        on = "<Delete>";
        run = "cancel";
        desc = "Cancel the task";
      }
    ];
    input = [
      {
        on = "<Esc>";
        run = "close";
        desc = "Cancel input";
      }
      {
        on = "<Enter>";
        run = "close --submit";
        desc = "Submit input";
      }
      {
        on = "<Left>";
        run = "move -1";
        desc = "Previous character";
      }
      {
        on = "<Right>";
        run = "move 1";
        desc = "Next character";
      }
      {
        on = "<Home>";
        run = "move -999";
        desc = "Move to the start";
      }
      {
        on = "<End>";
        run = "move 999";
        desc = "Move to the end";
      }
      {
        on = "<C-Left>";
        run = "backward";
        desc = "Move left 1 word";
      }
      {
        on = "<C-Right>";
        run = "forward --end-of-word";
        desc = "Move right 1 word";
      }
      {
        on = "<Backspace>";
        run = "backspace";
        desc = "Backspace";
      }
      {
        on = "<Delete>";
        run = "backspace --under";
        desc = "Delete";
      }
      {
        on = "<C-Backspace>";
        run = "kill backward";
        desc = "Backspace 1 word";
      }
    ];
    confirm = [
      {
        on = "n";
        run = "close";
      }
      {
        on = "y";
        run = "close --submit";
      }
      {
        on = "<Up>";
        run = "arrow -1";
      }
      {
        on = "<Down>";
        run = "arrow 1";
      }
      {
        on = "<PageUp>";
        run = "arrow -10";
      }
      {
        on = "<PageDown>";
        run = "arrow 10";
      }
      {
        on = "<C-Home>";
        run = "arrow -9999999";
      }
      {
        on = "<C-End>";
        run = "arrow 9999999";
      }
    ];
    completion = [
      {
        on = "<Esc>";
        run = "close";
        desc = "Cancel completion";
      }
      {
        on = "<Tab>";
        run = "close --submit";
        desc = "Accept completion";
      }
      {
        on = "<Enter>";
        run = [
          "close --submit"
          "close_input --submit"
        ];
        desc = "Accept completion and input";
      }
      {
        on = "<Up>";
        run = "arrow -1";
        desc = "Previous completion";
      }
      {
        on = "<Down>";
        run = "arrow 1";
        desc = "Next completion";
      }
    ];
    help = [
      {
        on = "<Esc>";
        run = "escape";
      }
      {
        on = "<Up>";
        run = "arrow -1";
      }
      {
        on = "<Down>";
        run = "arrow 1";
      }
      {
        on = "/";
        run = "filter";
      }
    ];
  };
in
builtins.mapAttrs (name: value: {
  keymap =
    if name == "help" then
      value
    else
      (
        value
        ++ [
          {
            on = "<F1>";
            run = "help";
            desc = "All keymaps";
          }
        ]
      );
}) keymaps
