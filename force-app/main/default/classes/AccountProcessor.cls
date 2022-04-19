public class AccountProcessor {

    @future
    public static void countContacts(List<ID> accountsId){
        List<Account> acct = [SELECT ID, Name, Number_Of_Contacts__c FROM Account WHERE ID IN :accountsId];
        List<Contact> cont = [SELECT Name, AccountId FROM Contact];
        Integer count = 0;
        
        for(Account a : acct){
            for(Contact c : cont){
                if(c.AccountId == a.ID){
                    count++;
                }
            }
            
            a.Number_Of_Contacts__c = count;
            count = 0;
        }
        
	}
}