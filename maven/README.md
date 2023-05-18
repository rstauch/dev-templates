create a **.envrc** file in your project directory  
`touch .envrc`

add:  
`use flake "github:rstauch/dev-templates?dir=maven/3.5.4"`
`use flake "github:rstauch/dev-templates?dir=maven/3.6.3"`
`use flake "github:rstauch/dev-templates?dir=maven/3.8.4"`

run:  
`direnv allow`

test with:  
```
mvn --version
```