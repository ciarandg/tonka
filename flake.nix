{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      tonka = pkgs.stdenv.mkDerivation {
        pname = "tonka";
        version = "0.0.1";
        src = ./.;
        nativeBuildInputs = [];
        buildPhase = "";
        installPhase = ''
          mkdir -p $out
          cp -r ./. $out/
        '';
      };

      default = self.packages.${system}.tonka;

      # `nix run .#nvim -- foo.tf` for Neovim with Tonka preinstalled
      nvim = pkgs.neovim.override {
        configure = {
          extraConfig = ''
            let mapleader = "\\"
          '';

          packages.myPlugins = {
            start = [
              self.packages.${system}.tonka
              pkgs.vimPlugins.nfnl # Fennel autocompilation
            ];
            opt = [];
          };
        };
      };
    };

    # `nix develop` launches shell with custom neovim
    devShells.${system}.default = pkgs.mkShell {
      packages = [self.packages.${system}.nvim];
    };
  };
}
