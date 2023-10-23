{
  description = "A flake for JDK, Maven and Gradle (Java 11)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    ,
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      javaVersion = 11;

      overlays = [
        (self: super: rec {
          jdk = super."jdk${toString javaVersion}";
          gradle = super.gradle.override {
            java = jdk;
          };
          maven = super.maven.override {
            inherit jdk;
          };
        })
      ];

      pkgs = import nixpkgs { inherit overlays system; };
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [ gradle jdk maven ];
      };
    });
}
