create a **.envrc** file in your project directory
`touch .envrc`

add:
`use flake "github:rstauch/dev-templates?dir=node/18"`

run:
`direnv allow`

test with:

```
node --version
yarn --version
```
