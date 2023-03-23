{ config, lib, pkgs, ... }:

let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "/home/foo-dogsquared/dotfiles";
in
{
  # Putting the dotfiles in their rightful place.
  xdg.configFile = {
    doom.source = "${dotfiles}/emacs";
    wezterm.source = "${dotfiles}/wezterm";
    nvim.source = "${dotfiles}/nvim";
  };
}
