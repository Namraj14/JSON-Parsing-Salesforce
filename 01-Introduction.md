# Introduction to JSON

## What is JSON?

JSON stands for **JavaScript Object Notation**.

JSON is a lightweight data format used to exchange information between systems.

Example:

```json
{
    "name":"Raj",
    "age":23
}
```

---

## Why Do We Need JSON?

Different systems use different technologies.

Example:

```text
Salesforce
    ↔
Java Application

Salesforce
    ↔
NodeJS Application

Salesforce
    ↔
Payment Gateway

Salesforce
    ↔
External API
```

JSON provides a common format that all systems can understand.

---

## Real World Example

Suppose Salesforce sends:

```text
Customer Name = Raj

Age = 23
```

Instead of sending plain text, we send:

```json
{
    "name":"Raj",
    "age":23
}
```

This format is understood universally.

---

## Where is JSON Used in Salesforce?

### REST API

Request:

```json
{
    "accountName":"ABC Corp"
}
```

Response:

```json
{
    "success":true
}
```

---

### LWC ↔ Apex

Apex sends:

```json
{
    "accountName":"ABC Corp",
    "isSelected":true
}
```

LWC receives JSON automatically.

---

### External Integrations

```text
Salesforce
    ↔
SAP

Salesforce
    ↔
MuleSoft

Salesforce
    ↔
Payment Systems

Salesforce
    ↔
Marketing Platforms
```

Most integrations use JSON.

---

## JSON vs XML

### JSON

```json
{
    "name":"Raj"
}
```

### XML

```xml
<customer>
    <name>Raj</name>
</customer>
```

### Comparison

| JSON                | XML                 |
| ------------------- | ------------------- |
| Lightweight         | Verbose             |
| Easy to Read        | More Tags           |
| Faster Parsing      | Slower Parsing      |
| Common in REST APIs | Common in SOAP APIs |

---

## JSON Structure

JSON consists of:

```text
Keys

Values

Objects

Arrays
```

Example:

```json
{
    "name":"Raj",
    "age":23
}
```

Keys:

```text
name
age
```

Values:

```text
Raj
23
```

---

## JSON Objects

Represented by:

```text
{}
```

Example:

```json
{
    "name":"Raj"
}
```

---

## JSON Arrays

Represented by:

```text
[]
```

Example:

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

---

## Nested JSON

JSON can contain Objects inside Objects.

Example:

```json
{
    "account":{
        "name":"ABC Corp",
        "industry":"Technology"
    }
}
```

---

## JSON Array Inside Object

Example:

```json
{
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

---

## JSON in Salesforce

Salesforce converts:

```apex
Account
Contact
Wrapper Classes
Lists
Maps
```

into JSON using:

```apex
JSON.serialize()
```

and converts JSON back into Apex using:

```apex
JSON.deserialize()
```

---

## Memory Formula

```text
Salesforce Object
        ↓
      JSON
        ↓
External System
```

---

## Key Takeaways

```text
JSON = Data Exchange Format

Used In:
    REST APIs
    LWC
    Integrations

{} = Object

[] = Array

JSON is lighter than XML

Most Salesforce integrations use JSON
```
