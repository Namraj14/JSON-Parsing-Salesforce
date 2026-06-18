# JSONGenerator

## Introduction

So far we have learned:

```apex
JSON.serialize()

JSON.deserialize()

JSON.deserializeUntyped()

JSONParser
```

These methods work automatically.

Sometimes, however, we need complete control over the JSON being generated.

For such scenarios Salesforce provides:

```apex
JSONGenerator
```

---

# What is JSONGenerator?

JSONGenerator allows us to manually build JSON.

```text
Apex
 ↓
JSONGenerator
 ↓
Custom JSON
```

Instead of Salesforce automatically creating JSON, we create it field by field.

---

# Why Use JSONGenerator?

Use JSONGenerator when:

```text
Custom JSON Format Required

Third-Party API Requirements

Need Full Control

Complex Integrations

Performance Optimizations
```

---

# Creating a JSONGenerator

```apex
JSONGenerator generator =
    JSON.createGenerator(true);
```

Parameter:

```text
true
 ↓
Pretty Print JSON
```

---

# Basic Structure

```apex
JSONGenerator generator =
    JSON.createGenerator(true);

generator.writeStartObject();

generator.writeEndObject();

String jsonString =
    generator.getAsString();
```

---

# Example 1 - Simple JSON

### Apex

```apex
JSONGenerator generator =
    JSON.createGenerator(true);

generator.writeStartObject();

generator.writeStringField(
    'name',
    'Raj'
);

generator.writeNumberField(
    'age',
    23
);

generator.writeEndObject();

String jsonString =
    generator.getAsString();

System.debug(jsonString);
```

### Output

```json
{
  "name" : "Raj",
  "age" : 23
}
```

---

# Common Field Methods

## String

```apex
generator.writeStringField(
    'name',
    'Raj'
);
```

---

## Number

```apex
generator.writeNumberField(
    'age',
    23
);
```

---

## Boolean

```apex
generator.writeBooleanField(
    'isActive',
    true
);
```

---

## Null

```apex
generator.writeNullField(
    'city'
);
```

---

# Example 2 - Multiple Datatypes

### Apex

```apex
JSONGenerator generator =
    JSON.createGenerator(true);

generator.writeStartObject();

generator.writeStringField(
    'name',
    'Raj'
);

generator.writeNumberField(
    'salary',
    50000
);

generator.writeBooleanField(
    'isActive',
    true
);

generator.writeNullField(
    'city'
);

generator.writeEndObject();

System.debug(
    generator.getAsString()
);
```

---

# Output

```json
{
  "name" : "Raj",
  "salary" : 50000,
  "isActive" : true,
  "city" : null
}
```

---

# Example 3 - Nested Object

### JSON Required

```json
{
  "account": {
    "name": "ABC Corp",
    "industry": "Technology"
  }
}
```

### Apex

```apex
JSONGenerator generator =
    JSON.createGenerator(true);

generator.writeStartObject();

generator.writeFieldName(
    'account'
);

generator.writeStartObject();

generator.writeStringField(
    'name',
    'ABC Corp'
);

generator.writeStringField(
    'industry',
    'Technology'
);

generator.writeEndObject();

generator.writeEndObject();

System.debug(
    generator.getAsString()
);
```

---

# Example 4 - Array

### JSON Required

```json
{
  "cities": [
    "Mumbai",
    "Delhi",
    "Pune"
  ]
}
```

### Apex

```apex
JSONGenerator generator =
    JSON.createGenerator(true);

generator.writeStartObject();

generator.writeFieldName(
    'cities'
);

generator.writeStartArray();

generator.writeString('Mumbai');
generator.writeString('Delhi');
generator.writeString('Pune');

generator.writeEndArray();

generator.writeEndObject();

System.debug(
    generator.getAsString()
);
```

---

# Example 5 - Object + Array

### JSON Required

```json
{
  "account": {
    "name": "ABC Corp"
  },
  "contacts": [
    {
      "name": "Raj"
    },
    {
      "name": "Amit"
    }
  ]
}
```

### Apex

```apex
JSONGenerator generator =
    JSON.createGenerator(true);

generator.writeStartObject();

generator.writeFieldName(
    'account'
);

generator.writeStartObject();

generator.writeStringField(
    'name',
    'ABC Corp'
);

generator.writeEndObject();

generator.writeFieldName(
    'contacts'
);

generator.writeStartArray();

generator.writeStartObject();
generator.writeStringField(
    'name',
    'Raj'
);
generator.writeEndObject();

generator.writeStartObject();
generator.writeStringField(
    'name',
    'Amit'
);
generator.writeEndObject();

generator.writeEndArray();

generator.writeEndObject();

System.debug(
    generator.getAsString()
);
```

---

# Real World Example

Suppose an API requires:

```json
{
  "customerName": "Raj",
  "city": "Mumbai",
  "isActive": true
}
```

### Apex

```apex
JSONGenerator generator =
    JSON.createGenerator(true);

generator.writeStartObject();

generator.writeStringField(
    'customerName',
    'Raj'
);

generator.writeStringField(
    'city',
    'Mumbai'
);

generator.writeBooleanField(
    'isActive',
    true
);

generator.writeEndObject();

String requestBody =
    generator.getAsString();

request.setBody(
    requestBody
);
```

---

# JSONGenerator vs serialize()

## serialize()

```apex
JSON.serialize()
```

Pros:

```text
Easy

Less Code

Wrapper Based
```

Cons:

```text
Limited Control
```

---

## JSONGenerator

```apex
JSONGenerator
```

Pros:

```text
Full Control

Custom JSON

Complex Structures
```

Cons:

```text
More Code
```

---

# When Should You Use JSONGenerator?

Use:

```text
Custom JSON Required

Third Party API

Specific JSON Format

Complex Structures
```

---

# When Should You Avoid JSONGenerator?

Avoid:

```text
Simple Wrapper Classes

Normal Integrations

Standard JSON
```

Use:

```apex
JSON.serialize()
```

instead.

---

# Common Interview Questions

## What is JSONGenerator?

Used to manually create JSON.

---

## Which Method Creates a Generator?

```apex
JSON.createGenerator()
```

---

## Which Method Returns JSON String?

```apex
generator.getAsString()
```

---

## When Should You Use JSONGenerator?

When full control over JSON structure is required.

---

## Which Is Easier?

```apex
JSON.serialize()
```

---

## Which Provides More Control?

```apex
JSONGenerator
```

---

# Memory Tricks

```text
serialize()
 ↓
Automatic JSON

JSONGenerator
 ↓
Manual JSON
```

---

# Quick Revision Sheet

```text
JSONGenerator

JSON.createGenerator()

Common Methods

writeStartObject()

writeEndObject()

writeStartArray()

writeEndArray()

writeStringField()

writeNumberField()

writeBooleanField()

writeNullField()

getAsString()

Use Cases

Custom JSON

Third Party APIs

Complex Structures

serialize()
 ↓
Automatic

JSONGenerator
 ↓
Manual
```

