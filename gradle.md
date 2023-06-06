### Eclipse fails to resolve dependency - Windows
    In build.gradle: add
        apply plugin: "eclipse"
    Commandline:
        gradlew cleanEclipse eclipse
        
### To build without testing:
    Windows:
    gradlew build -x test
    
    Linux:
    ./gradlew build -x test
    
### To ignore CheckStyle failures
    checkstyle {
        ignoreFailures = true
    }
