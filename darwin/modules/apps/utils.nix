{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    nali
    rsync
    htop
    eza
  ];
}
