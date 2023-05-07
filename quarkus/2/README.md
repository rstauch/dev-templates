create a **.envrc** file in your project directory  
`touch .envrc`

add:  
`use flake "github:rstauch/dev-templates?dir=quarkus/3"`

run:  
`direnv allow`

test with:  
```
quarkus --version
```

*Note:* This will overrride any existing jbang quarkus reference in $HOME/.jbang/bin/quarkus. That means concurrent quarkus versions can not be used.