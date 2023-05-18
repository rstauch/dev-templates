{
  description = "A flake for GraalVM, JDK, Maven and Gradle (Java 11)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }: let
    java_version = "11";
  in
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
      jdk = pkgs."jdk${java_version}";
      gradle = pkgs.gradle.override {java = jdk;};
      graalvm = pkgs."graalvm${java_version}-ce";
      mvn = pkgs.maven;
      javaVersion = java_version;
    in {
      devShells.default = pkgs.mkShell {
        inherit javaVersion;
        buildInputs = [graalvm jdk gradle mvn];

        shellHook = ''
          export JAVA_HOME="${jdk}"
          export GRAALVM_HOME="${graalvm}"
          mkdir -p $HOME/jdks/jdk/${javaVersion} && ln -sfn "${jdk}" "$HOME/jdks/jdk/${javaVersion}"
        '';
      };
    });
}
