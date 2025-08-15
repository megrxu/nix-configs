# flake.nix
{
  description = "A flake for a Go development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = system: import nixpkgs {
        inherit system;
      };
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = pkgsFor system;
          go-dev-env = pkgs.buildEnv {
            name = "go-dev";
            paths = with pkgs; [
              go
              gopls
              delve
            ];
          };
          shellHook = ''
            echo "🐹 Go development environment loaded."
          '';
        in
        {
          default = go-dev-env;
        });
    };
}