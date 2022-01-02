## To build without testing:
Windows:
    gradlew build -x test
Linux:
    ./gradlew build -x test
    
## To ignore CheckStyle failures
    checkstyle {
        ignoreFailures = true
    }
