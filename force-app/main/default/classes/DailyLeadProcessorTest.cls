@isTest
private class DailyLeadProcessorTest {
    @isTest
    private static void test(){
        List<Lead> leads = new List<Lead>();
        
        for(Integer i = 0; i < 200; i++){
            leads.add(new Lead(LastName='Lead2 ' + i, Company='Company2 ' + i));
        }
        
        insert leads;
        
        Test.startTest();

        String cron = '0 0 0 * * ? *';
        
        System.schedule('DailyLeadProcessorTest', cron, new DailyLeadProcessor());
        
        List<Lead> l = [SELECT ID, LeadSource FROM Lead WHERE LeadSource='Dreamforce'];
        System.assertEquals(0, l.size());
        
        Test.stopTest();
        
        l = [SELECT ID, LeadSource FROM Lead WHERE LeadSource='Dreamforce'];
        System.assertEquals(200, l.size());
        
    }

}