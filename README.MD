## Dev

create `flake.nix`
stage flake with `git add .`
create `.envrc` with content `use flake .`
run `direnv allow`

## Update

nix flake update

## Fix Potential Issues

run the following command(s):
`nix-collect-garbage`
`direnv reload`
