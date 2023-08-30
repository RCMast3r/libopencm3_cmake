{ stdenv, gnumake, cmake, gcc-arm-embedded, libopencm3 }:

stdenv.mkDerivation rec {
  pname = "libopencm3_stm32f4";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [ gnumake cmake gcc-arm-embedded ];
  # dontPatch = true;
  # dontFixup = true;
  # dontStrip = true;
  # dontPatchELF = true;
  propagatedBuildInputs = [ libopencm3 ];
}
