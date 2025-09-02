### Serializing a Java object to a JSON string
```
String jsonString = objectMapper.writeValueAsString(person);
```

### Deserializing a JSON string
```
Person person = objectMapper.readValue(jsonString, Person.class);
```
