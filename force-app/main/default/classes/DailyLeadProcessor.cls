public with sharing class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext sc) {
        List<Lead> leadList = [SELECT Id,FirstName,LastName, LeadSource 
                                FROM Lead 
                                WHERE LeadSource = '' LIMIT 200];
        List<Lead> updateLead = new List<Lead>();
        if(leadList.size()>0){
            for(Lead l: leadList) {
                l.LeadSource = 'Dreamforce';
                updateLead.add(l);
            }
        }
        
        if(updateLead.size()>0) {
            update updateLead;
        }

    }
}
