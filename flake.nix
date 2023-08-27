{
  description = "asdf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    utils.url = "github:numtide/flake-utils";
    libopencm3.url = "path:/home/ben/hytech/libopencm3";
  };
  outputs = { self, nixpkgs, utils, libopencm3 }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ libopencm3.overlays.default ];
      };
    in
    {
      asdf = pkgs.callPackage ./default.nix { };
    };

}
