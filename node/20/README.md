create a **.envrc** file in your project directory
`touch .envrc`

add:
`use flake "github:rstauch/dev-templates?dir=node/20"`

run:
`direnv allow`

test with:

```
yarn node --version
```
