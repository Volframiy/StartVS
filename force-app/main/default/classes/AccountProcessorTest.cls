@isTest 
private class AccountProcessorTest {
    @isTest static void testCountContacts(){
        List<ID> listOfId = new List<ID>();
        for(Account a : [SELECT ID FROM Account]){
            listOfId.add(a.ID);
		}
        
        Test.startTest();
        AccountProcessor.countContacts(listOfId);
        Test.stopTest();
    }
}