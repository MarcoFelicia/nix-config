{
  bezier = [
    "ease-in, 0.12, 0, 0.39, 0"
    "ease-out, 0.39, 0.575, 0.565, 1"
    "ease-in-out, 0.4, 0, 0.2, 1"
    "linear, 1, 1, 1, 1"
  ];
  animation = [
    "windowsIn, 1, 2, ease-out, popin 70%"
    "windowsOut, 1, 3, ease-in, popin 0%"
    "windowsMove, 1, 4, ease-in-out, slide"
    "fade, 1, 2, linear"

    "layersIn, 1, 1, linear, fade"
    "layersOut, 1, 1, linear, fade"
    "fadeLayersIn, 1, 2, ease-out"
    "fadeLayersOut, 1, 2, ease-in"

    "workspaces, 1, 4, ease-in-out, slide"
    "border, 1, 2, linear"
  ];
}
