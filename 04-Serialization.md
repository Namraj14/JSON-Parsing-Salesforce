# Serialization

## Introduction

Serialization is the process of converting an Apex Object into a JSON String.

```text
Apex Object
      ↓
Serialization
      ↓
JSON String
```

Salesforce provides:

```apex
JSON.serialize()
```

for serialization.

---

# Why Do We Need Serialization?

External systems cannot understand:

```apex
Account acc = new Account();
```

They understand:

```json
{
    "Name":"ABC Corp"
}
```

Therefore Salesforce converts Apex Objects into JSON before sending data to external systems.

---

# Serialization Formula

```text
Apex Object
      ↓
JSON.serialize()
      ↓
JSON String
```

---

# Example 1 - Simple Object

### Apex

```apex
public class EmployeeWrapper {

    public String name;

    public Integer age;
}
```

### Anonymous Apex

```apex
EmployeeWrapper emp =
    new EmployeeWrapper();

emp.name = 'Raj';

emp.age = 23;

String jsonString =
    JSON.serialize(emp);

System.debug(jsonString);
```

### Output

```json
{
    "name":"Raj",
    "age":23
}
```

---

# Example 2 - Salesforce Object

### Apex

```apex
Account acc = new Account();

acc.Name = 'ABC Corp';

acc.Industry = 'Technology';

String jsonString =
    JSON.serialize(acc);

System.debug(jsonString);
```

### Output

```json
{
    "Name":"ABC Corp",
    "Industry":"Technology"
}
```

---

# Example 3 - List Serialization

### Apex

```apex
List<String> cities =
    new List<String>{
        'Mumbai',
        'Delhi',
        'Pune'
    };

String jsonString =
    JSON.serialize(cities);

System.debug(jsonString);
```

### Output

```json
[
    "Mumbai",
    "Delhi",
    "Pune"
]
```

---

# Example 4 - List of Objects

### Apex

```apex
List<Account> accounts =
    new List<Account>();

accounts.add(
    new Account(Name='ABC Corp')
);

accounts.add(
    new Account(Name='XYZ Corp')
);

String jsonString =
    JSON.serialize(accounts);

System.debug(jsonString);
```

### Output

```json
[
    {
        "Name":"ABC Corp"
    },
    {
        "Name":"XYZ Corp"
    }
]
```

---

# Example 5 - Wrapper Serialization

### Wrapper

```apex
public class AccountWrapper {

    public Account account;

    public Boolean isSelected;
}
```

### Anonymous Apex

```apex
AccountWrapper wrapper =
    new AccountWrapper();

wrapper.account =
    new Account(
        Name='ABC Corp'
    );

wrapper.isSelected = true;

String jsonString =
    JSON.serialize(wrapper);

System.debug(jsonString);
```

### Output

```json
{
    "account":{
        "Name":"ABC Corp"
    },
    "isSelected":true
}
```

---

# Example 6 - Nested Wrapper Serialization

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

### Output

```json
{
    "account":{
        "name":"ABC Corp",
        "industry":"Technology"
    }
}
```

---

# Real World Example

Suppose an external API expects:

```json
{
    "customerName":"Raj",
    "city":"Mumbai"
}
```

### Apex

```apex
public class CustomerWrapper {

    public String customerName;

    public String city;
}
```

### Serialize

```apex
CustomerWrapper customer =
    new CustomerWrapper();

customer.customerName = 'Raj';

customer.city = 'Mumbai';

String requestBody =
    JSON.serialize(customer);
```

### Send

```apex
request.setBody(requestBody);
```

---

# Serialization with Maps

### Apex

```apex
Map<String,String> details =
    new Map<String,String>();

details.put(
    'city',
    'Mumbai'
);

details.put(
    'country',
    'India'
);

String jsonString =
    JSON.serialize(details);
```

### Output

```json
{
    "city":"Mumbai",
    "country":"India"
}
```

---

# Serialization with Primitive Values

### String

```apex
JSON.serialize('Raj');
```

Output:

```json
"Raj"
```

---

### Integer

```apex
JSON.serialize(23);
```

Output:

```json
23
```

---

### Boolean

```apex
JSON.serialize(true);
```

Output:

```json
true
```

---

# Common Interview Question

## What Does JSON.serialize() Return?

Answer:

```text
JSON String
```

---

## Can We Serialize?

```text
Primitive Values
Lists
Maps
Wrapper Classes
Salesforce Objects
Custom Objects
```

Answer:

```text
Yes
```

---

# Common Mistakes

## Mistake 1

Trying to send Apex Object directly.

Wrong:

```apex
request.setBody(account);
```

Correct:

```apex
request.setBody(
    JSON.serialize(account)
);
```

---

## Mistake 2

Confusing Serialize and Deserialize.

```text
Serialize
 ↓
Object → JSON

Deserialize
 ↓
JSON → Object
```

---

# Memory Tricks

```text
Serialize
 ↓
Object To String

Deserialize
 ↓
String To Object
```

---

## Easy Formula

```text
Salesforce
      ↓
JSON.serialize()
      ↓
JSON
      ↓
External System
```

---

# Quick Revision Sheet

```text
Serialization

Object
 ↓
JSON.serialize()
 ↓
JSON String

Used For:
    REST Callouts
    APIs
    LWC
    Integrations

Can Serialize:
    Objects
    Lists
    Maps
    Wrappers
    Primitive Values

Serialize
 ↓
Object → JSON
```

