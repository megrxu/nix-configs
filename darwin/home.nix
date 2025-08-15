{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pure-prompt
    zsh-history-substring-search
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

    # Other Plugins
    source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh

    # 用于进入 Rust 开发环境的函数
    use-rust() {
      echo "🦀 Rust development environment loaded."
      nix shell ~/.local/state/nix/profiles/rust-dev
    }

    # 用于进入 Go 开发环境的函数
    use-go() {
      echo "🐹 Go development environment loaded."
      nix shell ~/.local/state/nix/profiles/go-dev
    };

    # 用于进入 Python 开发环境的函数
    use-python() {
      echo "🐍 Python development environment loaded."
      nix shell ~/.local/state/nix/profiles/python-dev
    };

    '';
  };

  home.stateVersion = "25.05";
}