# flake.nix (for a Rust project)
{
  description = "A Rust development environment";

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
            # Rust 工具链
            cargo
            rustc

            # IDE 支持和代码质量工具
            rust-analyzer
            clippy
            rustfmt

            openssl
            pkg-config
          ];

          shellHook = ''
            echo "🦀 Rust development environment loaded."
          '';
        };
      }
    );
}
