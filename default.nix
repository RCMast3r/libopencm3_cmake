{ stdenv, cmake, gcc-arm-embedded, libopencm3 }:

stdenv.mkDerivation rec {
  pname = "libopencm3_stm32f4";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [ cmake gcc-arm-embedded ];
  propagatedBuildInputs = [ libopencm3 ];
}
