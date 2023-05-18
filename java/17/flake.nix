{
  description = "A flake for GraalVM, JDK, Maven and Gradle (Java 17)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      javaVersion = 17;

      overlays = [
        (self: super: rec {
          jdk = super."jdk${toString javaVersion}";
          gradle = super.gradle.override {
            java = jdk;
          };
          maven = super.maven.override {
            inherit jdk;
          };
          graalvm = pkgs."graalvm${toString javaVersion}-ce";
        })
      ];

      pkgs = import nixpkgs {inherit overlays system;};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [gradle jdk maven];

        shellHook = ''
          ${pkgs.jdk}/bin/java -version

          export JAVA_HOME="${pkgs.jdk}"
          export GRAALVM_HOME="${pkgs.graalvm}"
          mkdir -p $HOME/jdks/jdk/${toString javaVersion} && ln -sfn "${pkgs.jdk}" "$HOME/jdks/jdk/${toString javaVersion}"
        '';
      };
    });
}
