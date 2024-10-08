{
  lib,
  pkgs,
  config,
  ...
}:
{
  home.pointerCursor =
    let
      name = "phinger-cursors-light";
    in
    {
      inherit name;
      gtk.enable = true;
      size = 24;
      package = pkgs.phinger-cursors.overrideAttrs (old: {
        installPhase = ''
          runHook preInstall
          mkdir -p $out/share/icons
          cp -r ./${name} $out/share/icons
          runHook postInstall
        '';
      });
    };
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };
}
