# gnome-settings.nix

{
  "org/gnome/desktop/input-sources" = {
    sources = [ ("xkb" "se") ];
    xkb-options = [ "terminate:ctrl_alt_bksp" ];
  };

  "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };

  "org/gnome/desktop/peripherals/touchpad" = {
    click-method = "areas";
    two-finger-scrolling-enabled = true;
  };

  "org/gnome/desktop/privacy" = {
    old-files-age = 30;
    recent-files-max-age = -1;
  };

  "org/gnome/desktop/session" = {
    idle-delay = 300;
  };

  "org/gnome/desktop/wm/keybindings" = {
    close = [ "<Shift><Super>q" ];
    move-to-workspace-1 = [ "<Shift><Super>1" ];
    move-to-workspace-2 = [ "<Shift><Super>2" ];
    move-to-workspace-3 = [ "<Shift><Super>3" ];
    move-to-workspace-4 = [ "<Shift><Super>4" ];
    move-to-workspace-left = [ "<Shift><Super>w" ];
    move-to-workspace-right = [ "<Shift><Super>e" ];
    switch-to-workspace-1 = [ "<Super>1" ];
    switch-to-workspace-2 = [ "<Super>2" ];
    switch-to-workspace-3 = [ "<Super>3" ];
    switch-to-workspace-4 = [ "<Super>4" ];
    switch-to-workspace-last = [ "<Super>q" ];
    switch-to-workspace-left = [ "<Super>w" ];
    switch-to-workspace-right = [ "<Super>e" ];
    toggle-fullscreen = [ "<Shift><Super>f" ];
  };

  "org/gnome/mutter" = {
    dynamic-workspaces = true;
    edge-tiling = true;
    workspaces-only-on-primary = true;
  };

  "org/gnome/settings-daemon/plugins/media-keys" = {
    custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
    play = "<Super>u";
    www = "<Super>b";
  };

  "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
    binding = "<Super>Return";
    command = "kgx";
    name = "Open Terminal";
  };

  "org/gnome/shell" = {
    favorite-apps = [
      "org.gnome.Nautilus.desktop"
      "firefox.desktop"
      "org.gnome.Console.desktop"
    ];
    welcome-dialog-last-shown-version = "46.2";
  };

  "org/gnome/shell/app-switcher" = {
    current-workspace-only = true;
  };

  "org/gnome/shell/keybindings" = {
    switch-to-application-1 = [];
    switch-to-application-2 = [];
    switch-to-application-3 = [];
    switch-to-application-4 = [];
  };
}

