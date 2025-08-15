# flake.nix (for a Python PDM project)
{
  description = "A Python development environment using PDM";

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
          pythonVersion = pkgs.python313;
          pythonWithTools = pythonVersion.withPackages (ps: with ps; [
            virtualenv
          ]);
          python-dev-env = pkgs.buildEnv {
            name = "python-dev";
            paths = with pkgs; [
              pythonWithTools
              pdm
            ];
          };
          shellHook = ''
            echo "🐍 Installing dependencies with PDM..."
          '';
        in
        {
          default = python-dev-env;
        });
    };
}