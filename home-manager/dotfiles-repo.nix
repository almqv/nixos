# dotfiles-repo.nix
{ lib, pkgs, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/.dotfiles";
  dotfilesRepoHTTPS = "https://github.com/almqv/dotfiles";
  dotfilesRepoSSH = "git@github.com:almqv/dotfiles.git";
in
{
  home.activation.cloneDotfiles = lib.mkIf (pkgs.lib.fileHasType "d" dotfilesDir && !pkgs.lib.fileHasType "d" "${dotfilesDir}/.git") {
    # Run only if ~/.dotfiles doesn't exist or isn't a git repo
    home.activation.script = ''
      if [ ! -d "${dotfilesDir}" ]; then
        git clone ${dotfilesRepoHTTPS} ${dotfilesDir} &&
        git -C ${dotfilesDir} remote set-url origin ${dotfilesRepoSSH}
      elif [ ! -d "${dotfilesDir}/.git" ]; then
        echo "Error: ${dotfilesDir} exists but is not a git repository."
        exit 1
      fi
    '';
  };
}

