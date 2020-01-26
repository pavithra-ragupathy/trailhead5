public class AccountProcessor {
    
    @future 
    public static void countContacts(List<ID> accountIds) {
        List<Contact> conListToAcc = new List<Contact>();
        Map<Id,List<Contact>> accContactMap = new Map<Id,List<Contact>>();
        List<Account> accListToUpdate = new List<Account>();
        
        List<Contact> conList = [SELECT id,AccountId FROM Contact WHERE AccountId =: accountIds];
        
        for(Contact c:conlist){
            if(accContactMap.Containskey(c.accountId)){
                List<Contact> conListToAcc1 = accContactMap.get(c.accountId);
                conListToAcc1.add(c);
                accContactMap.put(c.accountId,conListToAcc1);
            }
            else {
                conListToAcc.add(c);
                accContactMap.put(c.accountId,conListToAcc);
            }
        }
        
        Map<Id,Account> accMap = new Map<Id,Account>([SELECT id,Number_of_Contacts__c FROM Account WHERE Id =: accountIds]);
        for(Id accId:accMap.keySet()) {
            List<Contact> contactList = accContactMap.get(accId);
            Account acc = accMap.get(accId);
            acc.Number_of_Contacts__c = contactList.size();
            accListToUpdate.add(acc);            
        }
        
        if(accListToUpdate!=null && accListToUpdate.size()>0) {
            Update accListToUpdate;
        }
    }

}