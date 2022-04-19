@isTest
private class AddPrimaryContactTest {
    @isTest static void test(){
        List<Account> acc1 = new List<Account>();
        List<Account> acc2 = new List<Account>();
        
        for(Integer i = 0; i < 50; i++){
            acc1.add(new Account(Name='Acc1 ' + i, BillingState='NY'));
            acc2.add(new Account(Name='Acc2 ' + i, BillingState='CA'));
        }
        
        insert acc1;
        insert acc2;
        
        Contact c = new Contact(LastName='Hladkyi');
        
        Test.startTest();
        AddPrimaryContact apc = new AddPrimaryContact(c, 'CA');
        System.enqueueJob(apc);
        Test.stopTest();
    }

}