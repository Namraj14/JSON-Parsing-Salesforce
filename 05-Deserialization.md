# Deserialization

## Introduction

Deserialization is the process of converting a JSON String into an Apex Object.

```text
JSON String
      ↓
Deserialization
      ↓
Apex Object
```

Salesforce provides:

```apex
JSON.deserialize()
```

for deserialization.

---

# Why Do We Need Deserialization?

External systems send data in JSON format.

Example:

```json
{
    "name":"Raj",
    "age":23
}
```

Salesforce cannot directly access:

```text
name
age
```

until JSON is converted into an Apex object.

---

# Deserialization Formula

```text
JSON String
      ↓
JSON.deserialize()
      ↓
Apex Object
```

---

# Syntax

```apex
WrapperClass obj =
    (WrapperClass)
    JSON.deserialize(
        jsonString,
        WrapperClass.class
    );
```

---

# Example 1 - Simple Wrapper

### Wrapper

```apex
public class EmployeeWrapper {

    public String name;

    public Integer age;
}
```

### Anonymous Apex

```apex
String jsonResponse = '{
    "name":"Raj",
    "age":23
}';

EmployeeWrapper emp =
    (EmployeeWrapper)
    JSON.deserialize(
        jsonResponse,
        EmployeeWrapper.class
    );

System.debug(emp.name);
System.debug(emp.age);
```

---

# Example 2 - Salesforce Object

### JSON

```json
{
    "Name":"ABC Corp",
    "Industry":"Technology"
}
```

### Apex

```apex
String jsonResponse = '{
    "Name":"ABC Corp",
    "Industry":"Technology"
}';

Account acc =
    (Account)
    JSON.deserialize(
        jsonResponse,
        Account.class
    );

System.debug(acc.Name);
System.debug(acc.Industry);
```

---

# Example 3 - Wrapper with Boolean

### Wrapper

```apex
public class AccountWrapper {

    public String accountName;

    public Boolean isSelected;
}
```

### JSON

```json
{
    "accountName":"ABC Corp",
    "isSelected":true
}
```

### Apex

```apex
String jsonResponse = '{
    "accountName":"ABC Corp",
    "isSelected":true
}';

AccountWrapper wrapper =
    (AccountWrapper)
    JSON.deserialize(
        jsonResponse,
        AccountWrapper.class
    );

System.debug(wrapper.accountName);
System.debug(wrapper.isSelected);
```

---

# Example 4 - List Deserialization

### Wrapper

```apex
public class ContactWrapper {

    public String name;
}
```

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

List<ContactWrapper> contacts =
    (List<ContactWrapper>)
    JSON.deserialize(
        jsonResponse,
        List<ContactWrapper>.class
    );

System.debug(contacts);
```

---

# Example 5 - Nested JSON

### JSON

```json
{
    "account":{
        "name":"ABC Corp",
        "industry":"Technology"
    }
}
```

### Wrapper

```apex
public class CustomerWrapper {

    public AccountWrapper account;
}

public class AccountWrapper {

    public String name;

    public String industry;
}
```

### Apex

```apex
CustomerWrapper customer =
    (CustomerWrapper)
    JSON.deserialize(
        jsonResponse,
        CustomerWrapper.class
    );

System.debug(customer.account.name);
System.debug(customer.account.industry);
```

---

# Example 6 - Object + Array

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

### Wrapper

```apex
public class CustomerWrapper {

    public AccountWrapper account;

    public List<ContactWrapper> contacts;
}

public class AccountWrapper {

    public String name;
}

public class ContactWrapper {

    public String name;
}
```

---

# Real World API Example

### API Response

```json
{
    "success":true,
    "message":"Records Retrieved"
}
```

### Wrapper

```apex
public class ApiResponseWrapper {

    public Boolean success;

    public String message;
}
```

### Deserialize

```apex
ApiResponseWrapper response =
    (ApiResponseWrapper)
    JSON.deserialize(
        responseBody,
        ApiResponseWrapper.class
    );

System.debug(response.success);
System.debug(response.message);
```

---

# What Happens If JSON Has Extra Fields?

### JSON

```json
{
    "name":"Raj",
    "age":23,
    "city":"Mumbai"
}
```

### Wrapper

```apex
public class EmployeeWrapper {

    public String name;

    public Integer age;
}
```

### Result

```text
name = Raj

age = 23

city = Ignored
```

---

# What Happens If JSON Has Missing Fields?

### JSON

```json
{
    "name":"Raj"
}
```

### Wrapper

```apex
public class EmployeeWrapper {

    public String name;

    public Integer age;
}
```

### Result

```text
name = Raj

age = null
```

---

# Important Rule

JSON Key:

```json
{
    "accountName":"ABC Corp"
}
```

Wrapper:

```apex
public String accountName;
```

Works.

---

JSON Key:

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
customerName = null
```

---

# Common Mistakes

## Mistake 1

Wrong Datatype

JSON:

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

Wrong Variable Name

JSON:

```json
{
    "name":"Raj"
}
```

Wrong:

```apex
public String employeeName;
```

Correct:

```apex
public String name;
```

---

## Mistake 3

Confusing Object and List

JSON:

```json
{
    "data":{}
}
```

Use:

```apex
DataWrapper data;
```

---

JSON:

```json
{
    "data":[]
}
```

Use:

```apex
List<DataWrapper> data;
```

---

# Interview Questions

## What is Deserialization?

```text
Converting JSON into Apex Object
```

---

## Which Method Is Used?

```apex
JSON.deserialize()
```

---

## What Does It Return?

```text
Apex Object
```

---

## What Happens to Unknown JSON Fields?

```text
Ignored
```

---

## What Happens to Missing JSON Fields?

```text
null
```

---

# Memory Tricks

```text
Serialize
 ↓
Object → JSON

Deserialize
 ↓
JSON → Object
```

---

# Easy Formula

```text
External System
      ↓
JSON
      ↓
JSON.deserialize()
      ↓
Salesforce Object / Wrapper
```

---

# Quick Revision Sheet

```text
Deserialization

JSON String
 ↓
JSON.deserialize()
 ↓
Apex Object

Used For:
    API Responses
    REST APIs
    Integrations

Extra Fields
 ↓
Ignored

Missing Fields
 ↓
null

JSON Key
 ↓
Must Match
Wrapper Variable

Deserialize
 ↓
JSON → Object
```

