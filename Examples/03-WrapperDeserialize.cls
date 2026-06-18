public class AccountWrapper {

    public String accountName;

    public Boolean isActive;
}

String jsonResponse = '{
    "accountName":"ABC Corp",
    "isActive":true
}';

AccountWrapper wrapper =
    (AccountWrapper)
    JSON.deserialize(
        jsonResponse,
        AccountWrapper.class
    );

System.debug(wrapper.accountName);
System.debug(wrapper.isActive);
