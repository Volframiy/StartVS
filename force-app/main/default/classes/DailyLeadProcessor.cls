public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx){
        List<Lead> leads = [SELECT ID, Name, LeadSource FROM Lead WHERE LeadSource=''  LIMIT 200];
        
        for(Lead l : leads){
            l.LeadSource = 'Dreamforce';
        }
        
        update leads;
    }

}