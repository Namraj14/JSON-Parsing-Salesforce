# JSON Interview Questions

## Basic Questions

### 1. What is JSON?

**Answer:**

```text
JSON stands for JavaScript Object Notation.

It is a lightweight data format used to exchange data between systems.
```

---

### 2. Why is JSON used?

**Answer:**

```text
JSON provides a common format that different systems can understand.

Example:

Salesforce ↔ External API
Salesforce ↔ SAP
Salesforce ↔ MuleSoft
Salesforce ↔ Payment Gateway
```

---

### 3. What are the main building blocks of JSON?

**Answer:**

```text
Objects {}

Arrays []

Keys

Values
```

---

### 4. What does {} represent?

**Answer:**

```text
JSON Object
```

Example:

```json
{
    "name":"Raj"
}
```

---

### 5. What does [] represent?

**Answer:**

```text
JSON Array
```

Example:

```json
[
    {
        "name":"Raj"
    }
]
```

---

### 6. What is a Nested JSON?

**Answer:**

Object inside Object or Array inside Object.

Example:

```json
{
    "account":{
        "name":"ABC Corp"
    }
}
```

---

## JSON Datatype Questions

### 7. JSON String maps to which Apex datatype?

**Answer:**

```apex
String
```

---

### 8. JSON Number maps to which Apex datatype?

**Answer:**

```apex
Integer
or
Decimal
```

---

### 9. JSON true/false maps to which Apex datatype?

**Answer:**

```apex
Boolean
```

---

### 10. What happens when JSON contains null?

**Answer:**

```text
The Apex variable becomes null.
```

---

## Serialization Questions

### 11. What is Serialization?

**Answer:**

```text
Converting Apex Object into JSON String.
```

---

### 12. Which method is used for Serialization?

**Answer:**

```apex
JSON.serialize()
```

---

### 13. What does JSON.serialize() return?

**Answer:**

```text
JSON String
```

---

### 14. What can be serialized?

**Answer:**

```text
Salesforce Objects

Wrapper Classes

Lists

Maps

Primitive Values
```

---

### 15. Give an example of Serialization.

**Answer:**

```apex
Account acc = new Account(
    Name='ABC Corp'
);

String jsonString =
    JSON.serialize(acc);
```

---

## Deserialization Questions

### 16. What is Deserialization?

**Answer:**

```text
Converting JSON String into Apex Object.
```

---

### 17. Which method is used for Deserialization?

**Answer:**

```apex
JSON.deserialize()
```

---

### 18. What does JSON.deserialize() return?

**Answer:**

```text
Apex Object
```

---

### 19. What happens if JSON has extra fields?

**Answer:**

```text
Extra fields are ignored.
```

---

### 20. What happens if JSON has missing fields?

**Answer:**

```text
Missing fields become null.
```

---

### 21. Why must JSON keys match Apex variables?

**Answer:**

Because Salesforce maps JSON keys to Apex variables during deserialization.

Example:

JSON:

```json
{
    "name":"Raj"
}
```

Apex:

```apex
public String name;
```

Works correctly.

---

## deserializeUntyped Questions

### 22. What is JSON.deserializeUntyped()?

**Answer:**

Converts JSON into generic Apex collections.

---

### 23. When should deserializeUntyped() be used?

**Answer:**

```text
Unknown JSON Structure

Dynamic APIs

Third Party APIs
```

---

### 24. What does {} become in deserializeUntyped()?

**Answer:**

```apex
Map<String,Object>
```

---

### 25. What does [] become in deserializeUntyped()?

**Answer:**

```apex
List<Object>
```

---

### 26. Difference between deserialize() and deserializeUntyped()?

| deserialize()    | deserializeUntyped() |
| ---------------- | -------------------- |
| Known Structure  | Unknown Structure    |
| Wrapper Required | No Wrapper           |
| Strongly Typed   | Dynamic              |

---

## JSONParser Questions

### 27. What is JSONParser?

**Answer:**

A low-level parser that reads JSON token by token.

---

### 28. Which method creates a JSONParser?

**Answer:**

```apex
JSON.createParser()
```

---

### 29. What is a Token?

**Answer:**

A JSON element read by JSONParser.

Examples:

```text
START_OBJECT

FIELD_NAME

VALUE_STRING

END_OBJECT
```

---

### 30. When should JSONParser be used?

**Answer:**

```text
Large JSON

Performance Critical Parsing

Read Specific Fields Only
```

---

### 31. Which is easier: JSONParser or deserialize()?

**Answer:**

```apex
JSON.deserialize()
```

---

## JSONGenerator Questions

### 32. What is JSONGenerator?

**Answer:**

Used to manually generate JSON.

---

### 33. Which method creates a JSONGenerator?

**Answer:**

```apex
JSON.createGenerator()
```

---

### 34. Which method returns the generated JSON?

**Answer:**

```apex
generator.getAsString()
```

---

### 35. When should JSONGenerator be used?

**Answer:**

```text
Custom JSON Structure

Third Party API Requirements

Complex JSON Payloads
```

---

### 36. Which is easier: JSONGenerator or serialize()?

**Answer:**

```apex
JSON.serialize()
```

---

## Complex JSON Questions

### 37. How do you design a Wrapper from JSON?

**Answer:**

```text
1. Identify {}

2. Identify []

3. Identify Datatypes

4. Create Wrapper Structure
```

---

### 38. What does {} usually become?

**Answer:**

```apex
Wrapper Class
```

---

### 39. What does [] usually become?

**Answer:**

```apex
List<Wrapper>
```

---

### 40. How do you handle Nested JSON?

**Answer:**

Use Nested Wrapper Classes.

---

### 41. How do you handle Object + Array JSON?

**Answer:**

```apex
Object
 ↓
Wrapper

Array
 ↓
List<Wrapper>
```

---

## Salesforce Integration Questions

### 42. Why is JSON important in Salesforce Integrations?

**Answer:**

Because most REST APIs exchange data using JSON.

---

### 43. What is the typical flow in a REST Callout?

**Answer:**

```text
Create Request

Serialize Data

Send Callout

Receive JSON Response

Deserialize Response

Process Data
```

---

### 44. Which method converts Salesforce Object into JSON?

**Answer:**

```apex
JSON.serialize()
```

---

### 45. Which method converts JSON into Salesforce Object?

**Answer:**

```apex
JSON.deserialize()
```

---

### 46. Can Salesforce Objects be deserialized directly?

**Answer:**

Yes.

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

### 47. Can Wrapper Classes contain Salesforce Objects?

**Answer:**

Yes.

Example:

```apex
public Account account;
```

---

### 48. What is the most common use of Wrapper Classes in Integrations?

**Answer:**

```text
Complex JSON

Nested JSON

API Responses
```

---

### 49. Which is preferred for known JSON?

**Answer:**

```apex
Wrapper Class +
JSON.deserialize()
```

---

### 50. Which is preferred for unknown JSON?

**Answer:**

```apex
JSON.deserializeUntyped()
```

---

# 30-Second Revision

```text
JSON = Data Exchange Format

{} = Object

[] = Array

Serialize
 ↓
Object → JSON

Deserialize
 ↓
JSON → Object

deserializeUntyped()
 ↓
Unknown JSON

{} → Map<String,Object>

[] → List<Object>

JSONParser
 ↓
Read JSON

JSONGenerator
 ↓
Create JSON

Known JSON
 ↓
Wrapper

Unknown JSON
 ↓
Untyped

Most Salesforce Integrations
 ↓
JSON
```

