{ config, pkgs, ... }:

{
  home.username = "megrxu";
  home.homeDirectory = "/Users/megrxu";

  home.packages = with pkgs; [
    htop
    ripgrep-all
    eza
    git
    nali
    rsync
    vim

    vscode

    telegram-desktop
  ];

#   home.file.".config/starship.toml".source = ./config/starship.toml;
  home.file.".zshrc".source = ./config/zshrc;

  programs.git = {
    enable = true;
    userName = "Ray";
    userEmail = "megrxu@proton.me";
    extraConfig = {
      init.defaultBranch = "master";
      core.editor = "vim";
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -l";
      update = "nix-darwin switch --flake ~/Repo/megrxu/nix-configs/darwin";
    };
    # 在 .zshrc 的末尾添加自定义脚本
    initExtra = ''
    '';
  };

#   programs.starship.enable = true;

  home.stateVersion = "25.05";
}