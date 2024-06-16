# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: 

let
  # Import the dotfiles mapping function
  dotfilesMap = import ./dotfiles.nix { inherit lib; };

  # Specify the dotfiles directory
  dotfilesDir = "${config.home.homeDirectory}/.dotfiles";

  # Map the dotfiles
  dotfiles = dotfilesMap (builtins.toPath dotfilesDir);

  # Function to create home.file entries
  mkHomeFile = name: attrs:
    if attrs.type == "file" then
      {
        "home.file.${name}".source = attrs.path;
        "home.file.${name}".target = "${config.home.homeDirectory}/.${name}";
      }
    else if attrs.type == "directory" then
      {
        "home.file.${name}".source = attrs.path;
        "home.file.${name}".target = "${config.home.homeDirectory}/.${name}";
        "home.file.${name}".recursive = true;
      }
    else {};

  # Import the clone-dotfiles script
  cloneDotfiles = import ./dotfiles-repo.nix { inherit pkgs lib; };
in
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "elal";
    homeDirectory = "/home/elal";

    # Clone the dotfiles repo if necessary
    activation = {
      inherit cloneDotfiles;
    };

    # Map dotfiles to home.file entries
    files = lib.flatten (lib.mapAttrsToList mkHomeFile dotfiles.dotfiles);

    # Add stuff for your user as you see fit:
    # programs.neovim.enable = true;
    packages = with pkgs; [ 
      # steam 
      slack
    ];

    # Enable home-manager and git
    programs.home-manager.enable = true;
    programs.git.enable = true;

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11"; 
  };
}

