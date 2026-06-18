# JSON Basics

## Introduction

Before working with Salesforce Integrations, REST APIs, and Wrapper Classes, you must understand how to read JSON.

Every JSON structure is built using:

```text
Objects
Arrays
Keys
Values
Nested Objects
Nested Arrays
```

---

## JSON Object

A JSON Object is represented using:

```text
{}
```

Example:

```json
{
    "name":"Raj",
    "age":23
}
```

### Structure

```text
Object
│
├── name
└── age
```

### Rule

```text
{} = Object
```

---

## JSON Array

A JSON Array is represented using:

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

### Structure

```text
Array
│
├── Object 1
└── Object 2
```

### Rule

```text
[] = Collection of Items
```

---

## Key-Value Pair

JSON stores data as Key-Value pairs.

Example:

```json
{
    "name":"Raj"
}
```

### Breakdown

```text
Key   → name

Value → Raj
```

---

## Multiple Key-Value Pairs

Example:

```json
{
    "name":"Raj",
    "age":23,
    "city":"Mumbai"
}
```

### Breakdown

```text
name → Raj

age → 23

city → Mumbai
```

---

## Nested Object

An Object inside another Object.

Example:

```json
{
    "account":{
        "name":"ABC Corp",
        "industry":"Technology"
    }
}
```

### Structure

```text
Root
│
└── account
      │
      ├── name
      └── industry
```

### Rule

```text
Object Inside Object
=
Nested Object
```

---

## Nested Array

An Array inside an Object.

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

### Structure

```text
Root
│
└── contacts
      │
      ├── Raj
      └── Amit
```

---

## Object + Array Together

Example:

```json
{
    "account":{
        "name":"ABC Corp"
    },
    "contacts":[
        {
            "name":"Raj"
        }
    ]
}
```

### Structure

```text
Root
│
├── account
│     └── name
│
└── contacts
      └── name
```

---

## Array of Objects

Example:

```json
{
    "accounts":[
        {
            "name":"ABC Corp"
        },
        {
            "name":"XYZ Corp"
        }
    ]
}
```

### Structure

```text
accounts
│
├── ABC Corp
└── XYZ Corp
```

---

## Complex JSON Example

```json
{
    "success":true,
    "message":"Records Retrieved",
    "data":{
        "accounts":[
            {
                "id":101,
                "name":"ABC Corp"
            },
            {
                "id":102,
                "name":"XYZ Corp"
            }
        ],
        "totalRecords":2
    }
}
```

### Structure

```text
Root
│
├── success
├── message
│
└── data
      │
      ├── accounts
      │     ├── id
      │     └── name
      │
      └── totalRecords
```

---

## How to Read JSON Like an Architect

### Step 1

Find:

```text
{}
```

These are Objects.

---

### Step 2

Find:

```text
[]
```

These are Arrays.

---

### Step 3

Identify Keys.

Example:

```json
{
    "name":"Raj"
}
```

Key:

```text
name
```

---

### Step 4

Identify Datatypes.

Example:

```json
{
    "name":"Raj",
    "age":23,
    "isActive":true
}
```

```text
name → String

age → Number

isActive → Boolean
```

---

## JSON Analysis Example

### JSON

```json
{
    "customer":{
        "name":"ABC Corp",
        "city":"Mumbai"
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

### Analysis

```text
Root
│
├── customer
│     ├── name
│     └── city
│
└── contacts
      ├── name
      └── name
```

---

## Common JSON Patterns

### Pattern 1

Single Object

```json
{
    "name":"Raj"
}
```

---

### Pattern 2

Array

```json
[
    {
        "name":"Raj"
    }
]
```

---

### Pattern 3

Object Inside Object

```json
{
    "account":{
        "name":"ABC Corp"
    }
}
```

---

### Pattern 4

Object + Array

```json
{
    "account":{},
    "contacts":[]
}
```

---

### Pattern 5

Nested Object + Nested Array

```json
{
    "data":{
        "accounts":[]
    }
}
```

---

## Memory Rules

```text
{} = Object

[] = Array

Key : Value

Object Inside Object
=
Nested Object

Array Inside Object
=
Nested Array
```

---

## Quick Revision Sheet

```text
JSON Building Blocks

{}
↓
Object

[]
↓
Array

Key : Value

Object + Object
↓
Nested Object

Object + Array
↓
Nested Array

Always Identify:
1. Objects
2. Arrays
3. Keys
4. Values
5. Datatypes
```
