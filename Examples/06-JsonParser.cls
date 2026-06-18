String jsonResponse = '{
    "name":"Raj",
    "age":23
}';

JSONParser parser =
    JSON.createParser(
        jsonResponse
    );

while(parser.nextToken() != null) {

    if(parser.getCurrentToken() ==
       JSONToken.FIELD_NAME) {

        System.debug(
            parser.getText()
        );
    }
}
