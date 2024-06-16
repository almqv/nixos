# dotfiles.nix
{ lib, ... }:

let
  # Function to map a directory recursively
  mapDotfiles = dir: {
    inherit (lib) recursiveAttrSetOf;
    dotfiles = recursiveAttrSetOf (path: {
      inherit path;
      type = if lib.pathIsDirectory path then "directory" else "file";
    }) dir;
  };
in
  mapDotfiles
