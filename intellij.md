### Environment Set up
    1. File - Settings... - Build, Execution, Deployment - Build Tools - Maven
    User settings file: (override)
    Runner
        VM options: -Djavax.net.ssl.trustStoreTye=Windows-ROOT
        JRE:
    2. (Righ-click on the project) Open Module Settings - Project Settings
    Project - SDK:
    Modules - Sources - Language level:
    3. (Right-click on the Spring  application class) Modify Run Configuration...
    Modify options (link, dropdown) - click Add VM options
    In the VM box, enter your vm options
### Use a local logback.xml in Spring Boot applications
    vm option:
    -Dlogging.config=classpath:logback-local.xml
### Configure JVM parameters
    Run | Edit Configurations... | Modify options | Add VM options | OK
    In the "VM options" box, enter JVM options, e.g.
    -Dspring.application.name=webflux-mongo -Dspring.profiles.active=webfluxmongo-dev
    Restart Intellij
### Set Java Home
    Right Click On Project -> Open Module Settings -> Platform Seetings -> SDKs
### Find a class by name
    Ctrl N
### Re-organize Imports
    Ctrl + Alt + O
### Find a string
    Ctrl F
### Replace a string
    Ctrl R
### Unable to create tempDir, java.io.tmpdir is set to C:\Windows\
    Run - Edit Configurations... - Edit Environment variables - Check Include system environment variables:
### IntelliJ IDEA "cannot resolve symbol ObjectUtils"
    File | Invalidate Caches... | Mark first two checkboxes | Invalidate and Restart

### error "non-resolvable import pom" when building a Maven project in Intellij
    Remove AppData\Local\JetBrains\IdeaIC2024.2\Maven\Projects\*
