# flake.nix (for a Go project)
{
  description = "A Go development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Go 工具链
            go

            # IDE 支持和调试工具
            gopls # Go Language Server
            delve # Go Debugger
          ];

          shellHook = ''
            echo "🐹 Go development environment loaded."

            # export CGO_ENABLED=1
          '';
        };
      }
    );
}