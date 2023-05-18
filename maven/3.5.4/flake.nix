{
  description = "A flake for installing apache-maven-3_5_4";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      mavenPackages = import ./../mvn.nix {
        inherit (pkgs) stdenv lib fetchurl coreutils makeWrapper;
      };
    in {
      devShell = pkgs.mkShell {
        buildInputs = [
          mavenPackages.apache-maven-3_5_4
        ];
      };
    });
}
