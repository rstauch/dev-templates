create a **.envrc** file in your project directory  
`touch .envrc`

add:  
`use flake "github:rstauch/dev-templates?dir=java/17"`

run:  
`direnv allow`

test with:  
```
echo $JAVA_HOME
echo $GRAALVM_HOME
java --version
mvn --version
gradle -v
```

*Note:*  the JDK (version 11) will be available at **$HOME/jdks/jdk/11** even after unloading the project directory and thus can be used by intelliJ.