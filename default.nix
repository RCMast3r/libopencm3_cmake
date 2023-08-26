{ stdenv, gnumake, gcc-arm-embedded, python3 }:

stdenv.mkDerivation rec {
  pname = "libopencm3";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = [ gnumake gcc-arm-embedded python3 ];
  # TODO use this variable as the one to override for the build
  device = "";
  dontPatch = true;
  dontFixup = true;
  dontStrip = true;
  # TODO figure out how we want to handle the linker scripts
  installPhase = ''
    mkdir -p $out/lib
    find . -maxdepth 2 -type f -name "*.a" -exec cp {} $out/lib \;
    mkdir -p $out/include
    source_dir="include"
    destination_dir="$out/include"

    # Create the destination directory if it doesn't exist
    mkdir -p "$destination_dir"

    # Use find to locate .h files and copy them while maintaining relative paths
    find "$source_dir" -type f -name "*.h" | while read file; do
        # Get the relative path of the file
        rel_path="''${file#$source_dir}"
        
        # Remove the leading slash
        rel_path="''${rel_path#/}"
        
        # Create the subdirectory structure in the destination directory
        mkdir -p "$destination_dir/$(dirname "$rel_path")"
        
        # Copy the file to the destination directory
        cp "$file" "$destination_dir/$rel_path"
    done

    
  '';
}
