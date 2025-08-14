{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Languages
    rustup
    pdm
    virtualenv
    elan
    
    # Tools
    git

    # IDEs
    vscode
  ];
}
