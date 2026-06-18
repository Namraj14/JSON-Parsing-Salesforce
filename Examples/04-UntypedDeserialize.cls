String jsonResponse = '{
    "name":"Raj",
    "age":23
}';

Map<String,Object> result =
    (Map<String,Object>)
    JSON.deserializeUntyped(
        jsonResponse
    );

System.debug(result.get('name'));
System.debug(result.get('age'));
