{
  username = "laptop";
  system = "x86_64-linux";
  stable = true;

  monitor = { };

  features = [
    "dconf"
    "firefox"
    "gnome-terminal"
    "gpg"
    "starship"
    "vscodium"
    "zsh"

    "gnome"
  ];
}
