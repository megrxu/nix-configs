# flake.nix (for a Rust project)
{
  description = "A flake for a Rust development environment";

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
          rust-dev-env = pkgs.buildEnv {
            name = "rust-dev";
            paths = with pkgs; [
              rustup

              openssl
              pkg-config
            ];
          };
          shellHook = ''
            echo "🦀 Rust development environment loaded."
          '';
        in
        {
          default = rust-dev-env;
        });
    };
}
