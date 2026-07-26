{
  description = "C ";

  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs = { self, nixpkgs } : 
  let 
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        gnumake
        gcc
        gdb
      ];
    };

  };
}
