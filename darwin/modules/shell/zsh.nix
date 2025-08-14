{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.pure-prompt
    pkgs.zsh-syntax-highlighting
    pkgs.zsh-autosuggestions
    pkgs.zsh-history-substring-search
  ];

  programs.zsh = {
    enable = true;

    interactiveShellInit = ''
      autoload -U promptinit; promptinit
      prompt pure

      # Plugins
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh

      # Bindkeys
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey "^[[3;5~" kill-word
      bindkey '^H' backward-kill-word
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
    '';
  };
}
