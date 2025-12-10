### auditing changes in the states of simple Java objects
```
* Macen dependency
<dependency>
    <groupId>org.javers</groupId>
    <artifactId>javers-core</artifactId>
    <version>3.1.0</version>
</dependency>
* Object Diff Engine: At its core, JaVers utilizes an object diff engine.
* JaVers Repository: JaVers stores the audit data in a specialized repository (database tables)
* Committing Changes: To audit an object, you explicitly "commit" it to JaVers
* Querying History (JQL): JaVers Query Language (JQL) to retrieve historical data

* Alternative to Javers: DB triggers
```
