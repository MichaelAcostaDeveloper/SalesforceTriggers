public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext context){

        List<Lead> lstLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        for (Lead objLead : lstLeads) {
            objLead.LeadSource = 'Dreamforce';
        }
        update lstLeads;
    }
}
