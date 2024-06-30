{ pkgs, config, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        output = [
          "eDP-1"
        ];
        modules-left = [ "hyprland/workspaces" "hyprland/mode" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "mpd" "temperature" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
        };
      };
    };
  };
}
