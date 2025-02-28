{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.tonka = pkgs.stdenv.mkDerivation {
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

    packages.x86_64-linux.default = self.packages.x86_64-linux.tonka;
  };
}
