public class EmployeeWrapper {

    public String name;

    public Integer age;
}

EmployeeWrapper emp =
    new EmployeeWrapper();

emp.name = 'Raj';

emp.age = 23;

String jsonString =
    JSON.serialize(emp);

System.debug(jsonString);

output
{
    "name":"Raj",
    "age":23
}
