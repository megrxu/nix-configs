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
    };

    initContent = ''
    promptinit
    prompt pure

    zstyle ':prompt:pure:prompt:*' color cyan

    # 用于进入 Rust 开发环境的函数
    use-rust() {
      echo "Entering Rust development environment... (type 'exit' to leave)"
      nix shell ~/.local/state/nix/profiles/rust-dev
    }

    # 用于进入 Go 开发环境的函数
    use-go() {
      echo "Entering Go development environment... (type 'exit' to leave)"
      nix shell ~/.local/state/nix/profiles/go-dev
    };
    '';
  };

  home.stateVersion = "25.05";
}