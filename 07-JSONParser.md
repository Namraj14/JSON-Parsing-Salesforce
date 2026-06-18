# JSONParser

## Introduction

So far we have learned:

```apex
JSON.serialize()

JSON.deserialize()

JSON.deserializeUntyped()
```

These methods work well for most situations.

However, sometimes:

* JSON is extremely large
* Only a few fields are needed
* Performance is important
* We want complete control over parsing

In such cases Salesforce provides:

```apex
JSONParser
```

---

# What is JSONParser?

JSONParser reads JSON token by token.

Think of it like reading a book word by word instead of reading the whole book at once.

```text
JSON
 ↓
Token
 ↓
Token
 ↓
Token
 ↓
Token
```

---

# Why Use JSONParser?

Use JSONParser when:

```text
Large JSON Response

Need Only Few Fields

Performance Critical

Custom Parsing Logic

Complex Integrations
```

---

# Creating a JSONParser

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

JSONParser parser =
    JSON.createParser(
        jsonResponse
    );
```

---

# What are Tokens?

JSONParser reads JSON as tokens.

Example:

```json
{
    "name":"Raj"
}
```

Tokens:

```text
START_OBJECT

FIELD_NAME

VALUE_STRING

END_OBJECT
```

---

# Common Tokens

| Token              | Meaning      |
| ------------------ | ------------ |
| START_OBJECT       | {            |
| END_OBJECT         | }            |
| START_ARRAY        | [            |
| END_ARRAY          | ]            |
| FIELD_NAME         | JSON Key     |
| VALUE_STRING       | String Value |
| VALUE_NUMBER_INT   | Integer      |
| VALUE_NUMBER_FLOAT | Decimal      |
| VALUE_TRUE         | true         |
| VALUE_FALSE        | false        |
| VALUE_NULL         | null         |

---

# Example 1 - Reading Tokens

### Apex

```apex
String jsonResponse = '{
    "name":"Raj",
    "age":23
}';

JSONParser parser =
    JSON.createParser(
        jsonResponse
    );

while(parser.nextToken() != null) {

    System.debug(
        parser.getCurrentToken()
    );
}
```

---

# Output

```text
START_OBJECT

FIELD_NAME

VALUE_STRING

FIELD_NAME

VALUE_NUMBER_INT

END_OBJECT
```

---

# Example 2 - Reading Field Names

### Apex

```apex
String jsonResponse = '{
    "name":"Raj",
    "age":23
}';

JSONParser parser =
    JSON.createParser(
        jsonResponse
    );

while(parser.nextToken() != null) {

    if(parser.getCurrentToken() ==
       JSONToken.FIELD_NAME) {

        System.debug(
            parser.getText()
        );
    }
}
```

---

# Output

```text
name

age
```

---

# Example 3 - Reading Values

### Apex

```apex
String jsonResponse = '{
    "name":"Raj",
    "age":23
}';

JSONParser parser =
    JSON.createParser(
        jsonResponse
    );

while(parser.nextToken() != null) {

    if(parser.getCurrentToken() ==
       JSONToken.VALUE_STRING) {

        System.debug(
            parser.getText()
        );
    }
}
```

---

# Output

```text
Raj
```

---

# Example 4 - Reading Specific Field

### JSON

```json
{
    "name":"Raj",
    "age":23,
    "city":"Mumbai"
}
```

### Apex

```apex
String jsonResponse = '{
    "name":"Raj",
    "age":23,
    "city":"Mumbai"
}';

JSONParser parser =
    JSON.createParser(
        jsonResponse
    );

while(parser.nextToken() != null) {

    if(parser.getCurrentToken() ==
       JSONToken.FIELD_NAME &&
       parser.getText() == 'city') {

        parser.nextToken();

        System.debug(
            parser.getText()
        );
    }
}
```

---

# Output

```text
Mumbai
```

---

# Example 5 - Array Parsing

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

JSONParser parser =
    JSON.createParser(
        jsonResponse
    );

while(parser.nextToken() != null) {

    if(parser.getCurrentToken() ==
       JSONToken.VALUE_STRING) {

        System.debug(
            parser.getText()
        );
    }
}
```

---

# Output

```text
Raj

Amit
```

---

# Real World Example

### API Response

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

### Requirement

Only read:

```text
status
```

without creating a Wrapper.

### Apex

```apex
JSONParser parser =
    JSON.createParser(
        responseBody
    );

while(parser.nextToken() != null) {

    if(parser.getCurrentToken() ==
       JSONToken.FIELD_NAME &&
       parser.getText() == 'status') {

        parser.nextToken();

        System.debug(
            parser.getText()
        );
    }
}
```

---

# JSONParser vs deserialize()

## deserialize()

```apex
JSON.deserialize()
```

Pros:

```text
Easy

Readable

Wrapper Based
```

Cons:

```text
Loads Entire JSON
```

---

## JSONParser

```apex
JSON.createParser()
```

Pros:

```text
Fast

Memory Efficient

Reads Specific Fields
```

Cons:

```text
More Code

Harder To Read
```

---

# When Should You Use JSONParser?

Use:

```text
Very Large JSON

Need Only Few Fields

Performance Critical APIs

Streaming Style Parsing
```

---

# When Should You Avoid JSONParser?

Avoid:

```text
Small JSON

Known Structure

Wrapper Already Exists
```

Use:

```apex
JSON.deserialize()
```

instead.

---

# Common Interview Questions

## What is JSONParser?

A low-level JSON parsing mechanism that reads JSON token by token.

---

## Why Use JSONParser?

To improve performance and parse only required fields.

---

## Which Method Creates a Parser?

```apex
JSON.createParser()
```

---

## What Does JSONParser Read?

```text
Tokens
```

---

## What Is a Token?

```text
START_OBJECT

FIELD_NAME

VALUE_STRING

END_OBJECT
```

---

## Which Is Better?

### Small JSON

```apex
JSON.deserialize()
```

### Large JSON

```apex
JSONParser
```

---

# Memory Tricks

```text
deserialize()
 ↓
Whole JSON

JSONParser
 ↓
Field By Field
```

---

# Quick Revision Sheet

```text
JSONParser

JSON.createParser()

Reads:
    Token By Token

Common Tokens

START_OBJECT

END_OBJECT

START_ARRAY

END_ARRAY

FIELD_NAME

VALUE_STRING

VALUE_NUMBER_INT

VALUE_TRUE

VALUE_FALSE

Use Cases

Large JSON

Performance

Read Specific Fields

Avoid For

Small JSON

Known Structures

Wrapper Based Parsing
```

