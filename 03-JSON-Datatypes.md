# JSON Data Types

## Introduction

Every value in JSON has a datatype.

Understanding JSON datatypes is important because Salesforce maps JSON values to Apex datatypes during deserialization.

Example:

```json
{
    "name":"Raj",
    "age":23,
    "salary":50000.50,
    "isActive":true
}
```

Salesforce automatically maps these values to Apex datatypes.

---

# JSON to Apex Mapping

| JSON Value | JSON Type | Apex Type |
| ---------- | --------- | --------- |
| "Raj"      | String    | String    |
| 23         | Number    | Integer   |
| 50000.50   | Number    | Decimal   |
| true       | Boolean   | Boolean   |
| false      | Boolean   | Boolean   |
| null       | Null      | null      |

---

# String

Strings are enclosed in double quotes.

### JSON

```json
{
    "name":"Raj"
}
```

### Apex

```apex
public String name;
```

---

## Multiple Strings

### JSON

```json
{
    "firstName":"Raj",
    "lastName":"Joshi",
    "city":"Mumbai"
}
```

### Apex

```apex
public String firstName;

public String lastName;

public String city;
```

---

# Integer

Whole numbers without decimal points.

### JSON

```json
{
    "age":23
}
```

### Apex

```apex
public Integer age;
```

---

## More Examples

### JSON

```json
{
    "quantity":100
}
```

### Apex

```apex
public Integer quantity;
```

---

# Decimal

Numbers containing decimal values.

### JSON

```json
{
    "salary":50000.50
}
```

### Apex

```apex
public Decimal salary;
```

---

## More Examples

### JSON

```json
{
    "price":199.99
}
```

### Apex

```apex
public Decimal price;
```

---

# Boolean

Represents true or false.

### JSON

```json
{
    "isActive":true
}
```

### Apex

```apex
public Boolean isActive;
```

---

## Example

### JSON

```json
{
    "isDeleted":false
}
```

### Apex

```apex
public Boolean isDeleted;
```

---

# Null

Represents an empty value.

### JSON

```json
{
    "city":null
}
```

### Apex

```apex
public String city;
```

Result:

```apex
city = null;
```

---

# Mixed Datatypes Example

### JSON

```json
{
    "name":"Raj",
    "age":23,
    "salary":50000.50,
    "isActive":true,
    "city":null
}
```

### Apex

```apex
public String name;

public Integer age;

public Decimal salary;

public Boolean isActive;

public String city;
```

---

# Datatypes Inside Arrays

### JSON

```json
{
    "scores":[10,20,30]
}
```

### Apex

```apex
public List<Integer> scores;
```

---

## Example

### JSON

```json
{
    "cities":[
        "Mumbai",
        "Delhi",
        "Pune"
    ]
}
```

### Apex

```apex
public List<String> cities;
```

---

# Datatypes Inside Objects

### JSON

```json
{
    "employee":{
        "name":"Raj",
        "age":23
    }
}
```

### Apex

```apex
public EmployeeWrapper employee;

public class EmployeeWrapper {

    public String name;

    public Integer age;
}
```

---

# Special Salesforce Datatypes

## Salesforce Id

### JSON

```json
{
    "accountId":"001XXXXXXXXXXXX"
}
```

### Apex

```apex
public Id accountId;
```

---

## Date

### JSON

```json
{
    "joiningDate":"2026-06-18"
}
```

### Apex

```apex
public Date joiningDate;
```

---

## Datetime

### JSON

```json
{
    "createdDate":"2026-06-18T10:30:00Z"
}
```

### Apex

```apex
public Datetime createdDate;
```

---

# Common Mistakes

## Mistake 1

### JSON

```json
{
    "age":23
}
```

Wrong:

```apex
public String age;
```

Correct:

```apex
public Integer age;
```

---

## Mistake 2

### JSON

```json
{
    "salary":50000.50
}
```

Wrong:

```apex
public Integer salary;
```

Correct:

```apex
public Decimal salary;
```

---

## Mistake 3

### JSON

```json
{
    "isActive":true
}
```

Wrong:

```apex
public String isActive;
```

Correct:

```apex
public Boolean isActive;
```

---

## Mistake 4

### JSON

```json
{
    "accountId":"001XXXXXXXXXXXX"
}
```

Wrong:

```apex
public String accountId;
```

Better:

```apex
public Id accountId;
```

---

# How to Identify Datatypes Quickly

### JSON

```json
{
    "name":"Raj",
    "age":23,
    "salary":50000.50,
    "isActive":true
}
```

Analysis:

```text
"Raj"
 ↓
String

23
 ↓
Integer

50000.50
 ↓
Decimal

true
 ↓
Boolean
```

---

# Memory Rules

```text
"Text"
 ↓
String

123
 ↓
Integer

123.45
 ↓
Decimal

true/false
 ↓
Boolean

null
 ↓
null
```

---

# Quick Revision Sheet

```text
JSON Datatypes

"Raj"
 ↓
String

23
 ↓
Integer

50000.50
 ↓
Decimal

true/false
 ↓
Boolean

null
 ↓
null

2026-06-18
 ↓
Date

2026-06-18T10:30:00Z
 ↓
Datetime

001XXXXXXXXXXXX
 ↓
Id
```

