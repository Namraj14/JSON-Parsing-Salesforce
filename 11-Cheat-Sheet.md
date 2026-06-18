# JSON Cheat Sheet

## JSON Basics

```text
JSON = JavaScript Object Notation

Used For:
    REST APIs
    Integrations
    LWC ↔ Apex
    External Systems
```

---

## JSON Symbols

```text
{} 
 ↓
Object

[]
 ↓
Array
```

Examples:

```json
{
    "name":"Raj"
}
```

```json
[
    {
        "name":"Raj"
    }
]
```

---

## JSON Datatypes

| JSON                   | Apex     |
| ---------------------- | -------- |
| "Raj"                  | String   |
| 23                     | Integer  |
| 5000.50                | Decimal  |
| true                   | Boolean  |
| false                  | Boolean  |
| null                   | null     |
| "2026-06-18"           | Date     |
| "2026-06-18T10:30:00Z" | Datetime |
| "001XXXXXXXXXXXX"      | Id       |

---

## JSON Analysis Formula

```text
Step 1
Identify {}

Step 2
Identify []

Step 3
Identify Datatypes

Step 4
Build Wrapper
```

---

## Wrapper Design Rules

```text
{} 
 ↓
Wrapper

[]
 ↓
List<Wrapper>
```

Example:

```json
{
    "data":{
        "name":"Raj"
    }
}
```

```apex
public DataWrapper data;
```

---

Example:

```json
{
    "data":[
        {
            "name":"Raj"
        }
    ]
}
```

```apex
public List<DataWrapper> data;
```

---

## Serialization

```text
Object
 ↓
JSON.serialize()
 ↓
JSON String
```

Example:

```apex
Account acc = new Account(
    Name='ABC Corp'
);

String jsonString =
    JSON.serialize(acc);
```

---

## Deserialization

```text
JSON String
 ↓
JSON.deserialize()
 ↓
Apex Object
```

Example:

```apex
Account acc =
(Account)
JSON.deserialize(
    jsonString,
    Account.class
);
```

---

## serialize vs deserialize

| serialize()   | deserialize() |
| ------------- | ------------- |
| Object → JSON | JSON → Object |
| Send Data     | Receive Data  |

---

## deserializeUntyped()

Used when JSON structure is unknown.

```apex
Map<String,Object> result =
(Map<String,Object>)
JSON.deserializeUntyped(
    jsonResponse
);
```

---

### Conversion Rules

```text
{}
 ↓
Map<String,Object>

[]
 ↓
List<Object>
```

---

## JSONParser

```apex
JSONParser parser =
    JSON.createParser(
        jsonResponse
    );
```

### Use Cases

```text
Large JSON

Performance Critical

Read Specific Fields
```

---

### Common Tokens

```text
START_OBJECT

END_OBJECT

START_ARRAY

END_ARRAY

FIELD_NAME

VALUE_STRING

VALUE_NUMBER_INT

VALUE_TRUE

VALUE_FALSE
```

---

## JSONGenerator

```apex
JSONGenerator generator =
    JSON.createGenerator(
        true
    );
```

### Use Cases

```text
Custom JSON

Third Party APIs

Complex Payloads
```

---

### Common Methods

```apex
writeStartObject()

writeEndObject()

writeStartArray()

writeEndArray()

writeStringField()

writeNumberField()

writeBooleanField()

writeNullField()

getAsString()
```

---

## Known JSON vs Unknown JSON

### Known JSON

```text
Wrapper Class
        +
JSON.deserialize()
```

Example:

```apex
EmployeeWrapper emp =
(EmployeeWrapper)
JSON.deserialize(
    jsonResponse,
    EmployeeWrapper.class
);
```

---

### Unknown JSON

```text
JSON.deserializeUntyped()
```

Example:

```apex
Map<String,Object> result =
(Map<String,Object>)
JSON.deserializeUntyped(
    jsonResponse
);
```

---

## Most Common Integration Flow

```text
External System
        ↓
JSON Response
        ↓
JSON.deserialize()
        ↓
Wrapper Class
        ↓
Process Data
```

---

## Common Mistakes

### Mistake 1

JSON:

```json
{
    "data":[]
}
```

Wrong:

```apex
DataWrapper data;
```

Correct:

```apex
List<DataWrapper> data;
```

---

### Mistake 2

JSON:

```json
{
    "data":{}
}
```

Wrong:

```apex
List<DataWrapper> data;
```

Correct:

```apex
DataWrapper data;
```

---

### Mistake 3

JSON Key Mismatch

JSON:

```json
{
    "accountName":"ABC Corp"
}
```

Wrapper:

```apex
public String customerName;
```

Result:

```text
null
```

---

### Mistake 4

Wrong Datatype

JSON:

```json
{
    "age":23
}
```

Wrong:

```apex
String age;
```

Correct:

```apex
Integer age;
```

---

## Interview One-Liners

### What is JSON?

```text
A lightweight data exchange format.
```

---

### What is Serialization?

```text
Object → JSON
```

---

### What is Deserialization?

```text
JSON → Object
```

---

### What is deserializeUntyped()?

```text
JSON → Map/List Structure
```

---

### What does {} become?

```text
Wrapper

or

Map<String,Object>
```

---

### What does [] become?

```text
List<Wrapper>

or

List<Object>
```

---

### What is JSONParser?

```text
Reads JSON token by token.
```

---

### What is JSONGenerator?

```text
Creates JSON manually.
```

---

### Which is preferred for known JSON?

```text
Wrapper + JSON.deserialize()
```

---

### Which is preferred for unknown JSON?

```text
JSON.deserializeUntyped()
```

---

## Ultimate Revision Sheet

```text
JSON

{}
 ↓
Object

[]
 ↓
Array

Serialize
 ↓
Object → JSON

Deserialize
 ↓
JSON → Object

Known JSON
 ↓
Wrapper

Unknown JSON
 ↓
deserializeUntyped()

{}
 ↓
Map<String,Object>

[]
 ↓
List<Object>

JSONParser
 ↓
Read JSON

JSONGenerator
 ↓
Create JSON

Most Salesforce Integrations
 ↓
JSON
 ↓
Wrapper
 ↓
Process Data
```

