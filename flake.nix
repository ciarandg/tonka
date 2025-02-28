{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.tonka-luarocks = pkgs.lua.pkgs.buildLuarocksPackage {
      pname = "tonka";
      version = "dev-1";
      src = ./.;
    };

    packages.x86_64-linux.tonka = pkgs.neovimUtils.buildNeovimPlugin {
      luaAttr = self.packages.x86_64-linux.tonka-luarocks;
      pname = "tonka";
      src = ./.;
    };

    packages.x86_64-linux.default = self.packages.x86_64-linux.tonka;
  };
}
