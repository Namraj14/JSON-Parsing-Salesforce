# Complex JSON

## Introduction

Real-world integrations rarely return simple JSON.

Most APIs return:

```text
Objects

Arrays

Nested Objects

Nested Arrays

Multiple Levels
```

To work with integrations effectively, you must learn how to analyze complex JSON and design the correct Wrapper Classes.

---

# JSON Analysis Formula

Whenever you see JSON:

```text
Step 1
Identify {}

Step 2
Identify []

Step 3
Identify Datatypes

Step 4
Create Wrapper Structure
```

---

# Example 1 - Object + Array

### JSON

```json
{
    "account":{
        "name":"ABC Corp",
        "industry":"Technology"
    },
    "contacts":[
        {
            "name":"Raj",
            "email":"raj@test.com"
        },
        {
            "name":"Amit",
            "email":"amit@test.com"
        }
    ]
}
```

---

### Analysis

```text
Root
│
├── account {}
│
└── contacts []
```

---

### Wrapper

```apex
public class CustomerWrapper {

    public AccountWrapper account;

    public List<ContactWrapper> contacts;
}

public class AccountWrapper {

    public String name;

    public String industry;
}

public class ContactWrapper {

    public String name;

    public String email;
}
```

---

# Example 2 - Nested Object

### JSON

```json
{
    "success":true,
    "data":{
        "name":"ABC Corp",
        "city":"Mumbai"
    }
}
```

---

### Analysis

```text
Root
│
├── success
│
└── data {}
```

---

### Wrapper

```apex
public class ResponseWrapper {

    public Boolean success;

    public DataWrapper data;
}

public class DataWrapper {

    public String name;

    public String city;
}
```

---

# Example 3 - Nested Array

### JSON

```json
{
    "success":true,
    "accounts":[
        {
            "id":101,
            "name":"ABC Corp"
        },
        {
            "id":102,
            "name":"XYZ Corp"
        }
    ]
}
```

---

### Analysis

```text
Root
│
├── success
│
└── accounts []
```

---

### Wrapper

```apex
public class ResponseWrapper {

    public Boolean success;

    public List<AccountWrapper> accounts;
}

public class AccountWrapper {

    public Integer id;

    public String name;
}
```

---

# Example 4 - Multi-Level JSON

### JSON

```json
{
    "success":true,
    "data":{
        "account":{
            "name":"ABC Corp",
            "industry":"Technology"
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
}
```

---

### Analysis

```text
Root
│
├── success
│
└── data
      │
      ├── account {}
      │
      └── contacts []
```

---

### Wrapper

```apex
public class ResponseWrapper {

    public Boolean success;

    public DataWrapper data;
}

public class DataWrapper {

    public AccountWrapper account;

    public List<ContactWrapper> contacts;
}

public class AccountWrapper {

    public String name;

    public String industry;
}

public class ContactWrapper {

    public String name;
}
```

---

# Example 5 - Real API Response

### JSON

```json
{
    "status":"SUCCESS",
    "message":"Records Retrieved",
    "errors":[
        {
            "code":"1001",
            "message":"Invalid Account"
        }
    ],
    "data":[
        {
            "id":101,
            "name":"ABC Corp"
        },
        {
            "id":102,
            "name":"XYZ Corp"
        }
    ]
}
```

---

### Analysis

```text
Root
│
├── status
├── message
├── errors []
│
└── data []
```

---

### Wrapper

```apex
public class ApiResponseWrapper {

    public String status;

    public String message;

    public List<ErrorWrapper> errors;

    public List<DataWrapper> data;
}

public class ErrorWrapper {

    public String code;

    public String message;
}

public class DataWrapper {

    public Integer id;

    public String name;
}
```

---

# Example 6 - Salesforce Objects JSON

### JSON

```json
{
    "accList":[
        {
            "Id":"001XXX",
            "Name":"ABC Corp"
        }
    ],
    "conList":[
        {
            "Id":"003XXX",
            "FirstName":"Raj"
        }
    ],
    "caseList":[
        {
            "Id":"500XXX",
            "CaseNumber":"00001001"
        }
    ]
}
```

---

### Wrapper

```apex
public class AccountContactCaseWrapper {

    public List<Account> accList;

    public List<Contact> conList;

    public List<Case> caseList;
}
```

---

# Example 7 - Deeply Nested JSON

### JSON

```json
{
    "company":{
        "account":{
            "name":"ABC Corp"
        },
        "departments":[
            {
                "departmentName":"Sales",
                "employees":[
                    {
                        "name":"Raj"
                    },
                    {
                        "name":"Amit"
                    }
                ]
            }
        ]
    }
}
```

---

### Analysis

```text
Root
│
└── company
      │
      ├── account
      │
      └── departments
             │
             └── employees
```

---

### Wrapper

```apex
public class RootWrapper {

    public CompanyWrapper company;
}

public class CompanyWrapper {

    public AccountWrapper account;

    public List<DepartmentWrapper> departments;
}

public class AccountWrapper {

    public String name;
}

public class DepartmentWrapper {

    public String departmentName;

    public List<EmployeeWrapper> employees;
}

public class EmployeeWrapper {

    public String name;
}
```

---

# Architect Approach

When JSON is received:

```json
{
    "data":{
        "accounts":[]
    }
}
```

Think:

```text
data
 ↓
Wrapper

accounts
 ↓
List<Wrapper>
```

before writing code.

---

# Common Mistakes

## Mistake 1

JSON

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

## Mistake 2

JSON

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

## Mistake 3

Using Wrapper for Salesforce Objects

JSON

```json
{
    "Id":"001XXX",
    "Name":"ABC Corp"
}
```

Better:

```apex
Account acc;
```

---

# Interview Questions

## How Do You Design a Wrapper from JSON?

Answer:

```text
1. Identify {}

2. Identify []

3. Identify Datatypes

4. Build Wrapper Structure
```

---

## What Does {} Become?

```text
Wrapper
```

---

## What Does [] Become?

```text
List<Wrapper>
```

---

## Which Is Easier?

```text
Known JSON
 ↓
Wrapper
```

---

## Which Is Better for Unknown JSON?

```text
deserializeUntyped()
```

---

# Memory Tricks

```text
{}
 ↓
Wrapper

[]
 ↓
List<Wrapper>

Object
+
Object
 ↓
Nested Wrapper

Object
+
Array
 ↓
Wrapper + List
```

---

# Quick Revision Sheet

```text
Complex JSON

Step 1
Identify {}

Step 2
Identify []

Step 3
Identify Datatypes

Step 4
Build Wrapper

Rules

{} → Wrapper

[] → List<Wrapper>

Known Structure
 ↓
Wrapper

Unknown Structure
 ↓
deserializeUntyped()

Most Common Real Scenarios

API Responses

Nested Objects

Nested Arrays

Salesforce Objects

Parent Child Data
```

