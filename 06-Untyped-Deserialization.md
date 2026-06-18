# Untyped Deserialization

## Introduction

So far we have used:

```apex
JSON.deserialize()
```

This works when we know the JSON structure beforehand.

Example:

```json
{
    "name":"Raj",
    "age":23
}
```

and we create:

```apex
public class EmployeeWrapper {

    public String name;

    public Integer age;
}
```

But what if we don't know the JSON structure?

This is where:

```apex
JSON.deserializeUntyped()
```

is used.

---

# What is Untyped Deserialization?

Untyped Deserialization converts JSON into generic Apex collections.

```text
JSON
 ↓
Map<String,Object>

List<Object>

Primitive Values
```

instead of Wrapper Classes.

---

# Syntax

```apex
Object result =
    JSON.deserializeUntyped(
        jsonString
    );
```

---

# Why Use Untyped Deserialization?

Use it when:

```text
JSON Structure Unknown

Dynamic APIs

Third-Party APIs

Large JSON Responses

No Wrapper Available
```

---

# Example 1 - Simple JSON

### JSON

```json
{
    "name":"Raj",
    "age":23
}
```

### Apex

```apex
String jsonResponse = '{
    "name":"Raj",
    "age":23
}';

Map<String,Object> result =
    (Map<String,Object>)
    JSON.deserializeUntyped(
        jsonResponse
    );

System.debug(result.get('name'));
System.debug(result.get('age'));
```

---

# Output

```text
Raj

23
```

---

# Understanding the Conversion

JSON:

```json
{
    "name":"Raj",
    "age":23
}
```

becomes:

```apex
Map<String,Object>
```

Structure:

```text
Map
│
├── name → Raj
└── age → 23
```

---

# Example 2 - Array

### JSON

```json
[
    {
        "name":"Raj"
    },
    {
        "name":"Amit"
    }
]
```

### Apex

```apex
String jsonResponse = '[
    {
        "name":"Raj"
    },
    {
        "name":"Amit"
    }
]';

List<Object> result =
    (List<Object>)
    JSON.deserializeUntyped(
        jsonResponse
    );

System.debug(result);
```

---

# Understanding the Conversion

JSON:

```json
[
    {
        "name":"Raj"
    },
    {
        "name":"Amit"
    }
]
```

becomes:

```apex
List<Object>
```

---

# Example 3 - Accessing Array Values

### JSON

```json
[
    {
        "name":"Raj"
    },
    {
        "name":"Amit"
    }
]
```

### Apex

```apex
List<Object> records =
    (List<Object>)
    JSON.deserializeUntyped(
        jsonResponse
    );

Map<String,Object> firstRecord =
    (Map<String,Object>)
    records[0];

System.debug(
    firstRecord.get('name')
);
```

---

# Output

```text
Raj
```

---

# Example 4 - Nested JSON

### JSON

```json
{
    "account":{
        "name":"ABC Corp",
        "industry":"Technology"
    }
}
```

### Apex

```apex
Map<String,Object> result =
    (Map<String,Object>)
    JSON.deserializeUntyped(
        jsonResponse
    );

Map<String,Object> account =
    (Map<String,Object>)
    result.get('account');

System.debug(
    account.get('name')
);

System.debug(
    account.get('industry')
);
```

---

# Understanding Nested JSON

JSON:

```json
{
    "account":{
        "name":"ABC Corp"
    }
}
```

becomes:

```text
Map
│
└── account
      │
      └── Map
             │
             └── name
```

---

# Example 5 - Object + Array

### JSON

```json
{
    "account":{
        "name":"ABC Corp"
    },
    "contacts":[
        {
            "name":"Raj"
        },
        {
            "name":"Amit"
        }
    ]
}
```

### Apex

```apex
Map<String,Object> result =
    (Map<String,Object>)
    JSON.deserializeUntyped(
        jsonResponse
    );

Map<String,Object> account =
    (Map<String,Object>)
    result.get('account');

List<Object> contacts =
    (List<Object>)
    result.get('contacts');

System.debug(
    account.get('name')
);

System.debug(contacts);
```

---

# Real World API Example

### Response

```json
{
    "status":"SUCCESS",
    "message":"Records Retrieved",
    "data":[
        {
            "id":101,
            "name":"ABC Corp"
        }
    ]
}
```

### Apex

```apex
Map<String,Object> response =
    (Map<String,Object>)
    JSON.deserializeUntyped(
        responseBody
    );

System.debug(
    response.get('status')
);

System.debug(
    response.get('message')
);
```

---

# Common Types Returned

| JSON  | Apex               |
| ----- | ------------------ |
| {}    | Map<String,Object> |
| []    | List<Object>       |
| "Raj" | String             |
| 23    | Integer/Decimal    |
| true  | Boolean            |
| null  | null               |

---

# Typed vs Untyped Deserialization

## Typed

```apex
JSON.deserialize()
```

Requires:

```text
Wrapper Class
Known Structure
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

## Untyped

```apex
JSON.deserializeUntyped()
```

Requires:

```text
No Wrapper

Unknown Structure
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

# When Should You Use Untyped?

Use:

```text
Unknown JSON

Dynamic APIs

Exploring API Responses

One-Time Parsing
```

---

# When Should You Avoid Untyped?

Avoid when:

```text
JSON Structure Known
```

Instead use:

```apex
Wrapper Classes
JSON.deserialize()
```

because it is:

```text
Cleaner

Safer

Easier to Maintain
```

---

# Common Mistakes

## Mistake 1

Treating Object as Map

Wrong:

```apex
Object result =
    JSON.deserializeUntyped(
        jsonResponse
    );

result.get('name');
```

Correct:

```apex
Map<String,Object> result =
(Map<String,Object>)
JSON.deserializeUntyped(
    jsonResponse
);
```

---

## Mistake 2

Forgetting Type Casting

Wrong:

```apex
result.get('account').get('name');
```

Correct:

```apex
Map<String,Object> account =
(Map<String,Object>)
result.get('account');

account.get('name');
```

---

# Interview Questions

## What is deserializeUntyped()?

Converts JSON into generic Apex collections.

---

## What Does {} Become?

```text
Map<String,Object>
```

---

## What Does [] Become?

```text
List<Object>
```

---

## When Should You Use It?

```text
Unknown JSON Structure
```

---

## Which Is Better?

Known JSON:

```text
JSON.deserialize()
```

Unknown JSON:

```text
JSON.deserializeUntyped()
```

---

# Memory Tricks

```text
Known JSON
 ↓
Wrapper
 ↓
deserialize()

Unknown JSON
 ↓
Map/List
 ↓
deserializeUntyped()
```

---

# Quick Revision Sheet

```text
deserializeUntyped()

{} 
 ↓
Map<String,Object>

[]
 ↓
List<Object>

Known Structure
 ↓
deserialize()

Unknown Structure
 ↓
deserializeUntyped()

Most Common Casts

(Map<String,Object>)

(List<Object>)

Use Cases

Dynamic APIs
Unknown Responses
Exploratory Parsing
```

