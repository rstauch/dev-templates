create a **.envrc** file in your project directory
`touch .envrc`

add:
`use flake "github:rstauch/dev-templates?dir=tools/just"`

run:
`direnv allow`

test with:

```
just --version
```
