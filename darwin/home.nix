{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pure-prompt
    eza
    htop
    ripgrep-all
    git
    nali
    rsync
    vim
    vscode
  ];

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
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      ls = "exa";
      ll = "exa -l";
      update = "darwin-rebuild switch --flake ~/Repo/megrxu/nix-configs/darwin";
    };

    initContent = ''
    promptinit
    prompt pure

    zstyle ':prompt:pure:prompt:*' color cyan
    '';
  };

  home.stateVersion = "25.05";
}