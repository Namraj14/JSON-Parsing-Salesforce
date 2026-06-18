JSONGenerator generator =
    JSON.createGenerator(
        true
    );

generator.writeStartObject();

generator.writeStringField(
    'name',
    'Raj'
);

generator.writeNumberField(
    'age',
    23
);

generator.writeEndObject();

String jsonString =
    generator.getAsString();

System.debug(jsonString);
