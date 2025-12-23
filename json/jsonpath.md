JSONPath filter
$.things[?(@.name =~ /Required.*/i)]

### **1. `$`**
- Refers to the **root** of the JSON document.

### **2. `.things`**
- Accesses the property named **things**, which is expected to be an array.

### **3. `[?()]`**
- A **filter expression**: it keeps only the elements for which the condition inside is true.

### **4. `@.name`**
- Refers to the **name** property of the current array element.

### **5. `=~`**
- Means **regex match**.

### **6. `/Required.*/i`**
This is the actual **regular expression**:

- `Required` → must start with the word “Required”
- `.*` → followed by zero or more characters
- `/i` → case‑insensitive match


## **Putting It All Together**

The JSONPath expression selects **all items in `things` whose `name` property starts with “Required” (case‑insensitive)**.


## Example

Given:

```json
{
  "things": [
    { "name": "RequiredField" },
    { "name": "optional" },
    { "name": "requiredValue" }
  ]
}
```

The expression would return:

```json
[
  { "name": "RequiredField" },
  { "name": "requiredValue" }
]
```
## Size matching
```
$[?(@.things.size() == 2)]

// matching
{ "things": [ { "name": "browser" }, { "name": "ide" } ] }
// not matching
{ "things": [ { "name": "json" } ] }
```


