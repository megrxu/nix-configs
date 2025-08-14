{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Languages
    rustup
    elan
    
    # Tools
    git

    # IDEs
    vscode
  ];
}
