### How does mapstruct generate mappers
```
* Maven dependency: mapstruct, mapstruct-processor
* Maven plugin

<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <version>3.13.0</version>
    <configuration>
        <annotationProcessorPaths>
            <path>
                <groupId>org.mapstruct</groupId>
                <artifactId>mapstruct-processor</artifactId>
                <version>1.6.3</version>
            </path>
        </annotationProcessorPaths>
    </configuration>
</plugin>

* Define a Mapper Interface: You define a Java interface and annotate it with @Mapper.
* Compile-Time Annotation Processing: During the compilation phase, MapStruct's annotation processor scans your
codebase for interfaces annotated with @Mapper
* Code Generation
* Customization with Annotations
```

