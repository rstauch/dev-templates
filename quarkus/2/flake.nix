{
  description = "A flake to install Quarkus-CLI (v2) via jbang";

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
    quarkus_version = "2.16.7";
    quarkus_sanitized = builtins.replaceStrings ["."] ["_"] quarkus_version;
  in
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
      # TODO: jbang aus nix-darwin aus homebrew nach packages verschieben: https://github.com/rstauch/nix-darwin/blob/9d6ebd91b7ddf87639e05740ee0aaf4a457579b4/modules/darwin/default.nix#L176
      jbang = pkgs.jbang;
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [jbang];

        shellHook = ''
          if ! ${pkgs.lib.getExe pkgs.jbang} app list -o | grep -q "quarkus_${quarkus_sanitized}"; then
            ${pkgs.lib.getExe pkgs.jbang} trust add https://repo1.maven.org/maven2/io/quarkus/quarkus-cli/
            ${pkgs.lib.getExe pkgs.jbang} app install --fresh --force --name "quarkus_${quarkus_sanitized}" io.quarkus:quarkus-cli:"${quarkus_version}".Final:runner
          fi
          ln -sf $HOME/.jbang/bin/quarkus_"${quarkus_sanitized}" $HOME/.jbang/bin/quarkus

          export PATH=$PATH:$HOME/.jbang/bin

          # add autocomplete
          source <(quarkus completion)
        '';
      };
    });
}
