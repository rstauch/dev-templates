create a **.envrc** file in your project directory  
`touch .envrc`

add:  
`use flake "github:rstauch/dev-templates?dir=java&java_version=11"`
`use flake "github:rstauch/dev-templates?dir=java&java_version=17"`

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

*Note:*  the JDK will be available at **$HOME/jdks/jdk/{java_version}** even after unloading the project directory and thus can be used by intelliJ.