{
  description = "Paper Writing";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-25.05";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    tex = pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-small
        biblatex
        biber
        titling
        xurl
        biblatex-apa
        csquotes;
    };

  in 
  {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        pandoc
        tex
      ];
    };
  };
}
