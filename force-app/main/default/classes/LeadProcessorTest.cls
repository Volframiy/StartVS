@isTest
private class LeadProcessorTest {

    @isTest static void test(){
        List<Lead> leadList = new List<Lead>();
        
        for(Integer i = 0; i < 100; i++){
            leadList.add(new Lead(LastName='Lead ' + i, Company='Company ' + i));
        }
        
        insert leadList;
        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Database.executeBatch(lp);
        Test.stopTest();
	}

}