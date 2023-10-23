create a **.envrc** file in your project directory
`touch .envrc`

add:
`use flake "github:rstauch/dev-templates?dir=java/17"`

run:
`direnv allow`

test with:

```
echo $JAVA_HOME
java --version
mvn --version
gradle -v
```
