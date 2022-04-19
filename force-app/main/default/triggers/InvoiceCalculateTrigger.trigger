trigger InvoiceCalculateTrigger on InvoiceLine__c (after insert) {
	List<InvoiceLine__c> lines = (List<InvoiceLine__c>)Trigger.New;
    Set<Id> invoicesIds= new Set<Id>(); 
    
    for(InvoiceLine__c line : lines){ 
        invoicesIds.add(line.Invoice__c);
	}
    
    List<Invoice__c> invoices = [
        SELECT ID, Name, Amount__c, MostRecentPaymentDay__c, TotalInvoiceLines__c,
        (SELECT Id, Amount__c, Payment_Date__c FROM Invoice_Lines__r)
        FROM Invoice__c 
        WHERE ID IN :invoicesIds
    ];
    
    for(Invoice__c invoice : invoices){
        Integer total = 0;
        Decimal amount = 0;
        Date mostRecent = Date.today();
        
        for(InvoiceLine__c line : invoice.Invoice_Lines__r){
            total++;
            amount += line.Amount__c;
            if(mostRecent > line.Payment_Date__c){
                mostRecent = line.Payment_Date__c;
            }
        }
        
        invoice.Amount__c = (invoice.Amount__c == null) ? amount : invoice.Amount__c + amount;
        invoice.TotalInvoiceLines__c += total;
        invoice.MostRecentPaymentDay__c = mostRecent;
    }
    
    upsert invoices;
}