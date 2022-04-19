@isTest
private class AccountManagerTest {
	@isTest static void testGetAccount() {
        Account a = new Account(Name='GenePoint');
        insert a;
        
        
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/' + a.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account acc = AccountManager.getAccount();
        System.debug(acc);
        // Verify results
        System.assert(acc != null);
        System.assertEquals(a.Name, acc.Name);
    }
}