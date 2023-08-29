{
  description = "asdf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    utils.url = "github:numtide/flake-utils";
    libopencm3.url = "github:RCMast3r/libopencm3";
  };
  outputs = { self, nixpkgs, utils, libopencm3 }:
    let
      libopencm3_stm32f4_overlay = final: prev: {
        libopencm3_stm32f4 = final.callPackage ./default.nix { };
      };

      my_overlays = [ libopencm3.overlays.default libopencm3_stm32f4_overlay ];
    in
    {


      overlays.default = nixpkgs.lib.composeManyExtensions my_overlays;
      packages.x86_64-linux =
        let
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [ self.overlays.default ];
          };
        in
        rec {
          libopencm3_stm32f4 = pkgs.libopencm3_stm32f4;
          default = libopencm3_stm32f4;
        };

    };
}
