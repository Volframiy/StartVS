@isTest
private class TestInvoice {
    @isTest 
    private static void test(){
        Invoice__c invoice = new Invoice__c(Name='Temp Invoice');
        insert invoice;
        
        List<InvoiceLine__c> lines = new List<InvoiceLine__c>();
        lines.add(new InvoiceLine__c(Name='Temp Line 1', Amount__c=200.0, Payment_Date__c=Date.today() + 2, Invoice__c=invoice.ID));
        lines.add(new InvoiceLine__c(Name='Temp Line 2', Amount__c=300.0, Payment_Date__c=Date.today() + 1, Invoice__c=invoice.ID));
        lines.add(new InvoiceLine__c(Name='Temp Line 3', Amount__c=500.0, Payment_Date__c=Date.today() + 5, Invoice__c=invoice.ID));
        
        Test.startTest();
        List<Database.SaveResult> result = Database.insert(lines);
        Test.stopTest();
        
        Invoice__c newInvoice = [
            SELECT ID, Name, Amount__c, MostRecentPaymentDay__c, TotalInvoiceLines__c 
        	FROM Invoice__c 
        	WHERE ID = :invoice.Id
        ];
        
        
        System.debug(newInvoice);
        
        System.assert(result[0].isSuccess());
        System.assertEquals(1000.0, newInvoice.Amount__c);
    }

}