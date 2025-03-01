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
    };
  };
}
