public class EmployeeWrapper {

    public String name;

    public Integer age;
}

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
