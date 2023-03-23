{ config, lib, pkgs, ... }:

let
  path = lib.escapeShellArg "/etc/dotfiles";
  dotfiles = pkgs.runCommandLocal "nixos-mutable-file-${builtins.baseNameOf path}" { } ''ln -s ${path} $out'';
in
{
  enviroment.etc = {
    "i3".source = "${dotfiles}/i3";
    "polybar".source = "${dotfiles}/polybar";
    "zathurarc".source = "${dotfiles}/zathura/zathurarc";
  };
}
