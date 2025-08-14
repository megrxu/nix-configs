# flake.nix (for a Python PDM project)
{
  description = "A Python development environment using PDM";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # 指定 Python 版本
        pythonVersion = pkgs.python313;
        pythonWithTools = pythonVersion.withPackages (ps: with ps; [
          virtualenv
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pythonWithTools
            pkgs.pdm
          ];

          shellHook = ''
            echo "✅ Python (PDM) environment loaded."

            pdm config venv.in_project true

            echo "🐍 Installing dependencies with PDM..."
            pdm install

            echo "🚀 Environment is ready. Run 'pdm run ...' or 'pdm shell'."
          '';
        };
      }
    );
}