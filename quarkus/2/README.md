create a **.envrc** file in your project directory  
`touch .envrc`

add:  
`use flake "github:rstauch/dev-templates?dir=java/17"`  
`use flake "github:rstauch/dev-templates?dir=quarkus/2"`

run:  
`direnv allow`

test with:  
```
quarkus --version
```

*Note:* This will overrride any existing jbang quarkus reference in `$HOME/.jbang/bin/quarkus`. That means there might be issues if multiple quarkus-cli version are to be used concurrently.