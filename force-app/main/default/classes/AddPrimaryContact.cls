public class AddPrimaryContact implements Queueable{
    private Contact cont;
    private String abb;
    
    public AddPrimaryContact(Contact cont, String abb){
        this.cont = cont;
        this.abb = abb;
    }
    
    public void execute(QueueableContext context){
        List<Account> acct = [SELECT ID, BillingState FROM Account WHERE BillingState = :abb LIMIT 200];
        List<Contact> listCont = new List<Contact>();
        
        for(Account a : acct){
            Contact c = cont.clone(false, true, false, true);
            c.AccountId = a.Id;
            listCont.add(c);
        }
        
        insert listCont;
    }

}