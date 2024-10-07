{
  username = "laptop";
  system = "x86_64-linux";
  stable = true;
  allowUnfree = true;

  features = [
    "dconf"
    "firefox"
    "gnome-terminal"
    "gpg"
    "vscodium"
    "zsh"

    "gnome"
  ];
}
