{
  description = "C ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-25.05";
  };

  outputs = { self, nixpkgs } : 
  let 
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        meson
        ninja
        gdb
      ];
    };

    packages.x86_64-linux.default = pkgs.stdenv.mkDerivation rec {
        name = "program";
        
        src = ./.;
        
        buildPhase = ''
          meson setup build $src
          meson compile -C build
        '';

        # Uncomment to run check
        # checkPhase = ''
        #   meson test
        # '';

        installPhase = ''
          mkdir -p $out/bin
          cp build/${name} $out/bin/
          # cp build/${name}_test $out/bin/
        '';

        /* build -> host? */
        nativeBuildInputs = [ pkgs.meson pkgs.ninja ];
        /* host -> target? */
        buildInputs = [ pkgs.gcc ];

        # Also uncomment to run check
        # doCheck = true;
    };
  };
}
