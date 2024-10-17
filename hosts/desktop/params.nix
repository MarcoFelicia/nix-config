{
  username = "desktop";
  system = "x86_64-linux";
  stable = false;

  monitor = {
    width = 2560;
    height = 1080;
    hz = 60;
  };

  features = [
    "hypr"

    "bat"
    "eww"
    "firefox"
    "gpg"
    "gtk"
    "kitty"
    "pass"
    "rofi"
    "starship"
    "vscodium"
    "yazi"
    "zsh"

    "password"

    "fonts"
  ];
}
