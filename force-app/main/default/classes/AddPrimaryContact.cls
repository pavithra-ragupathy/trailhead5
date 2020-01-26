public class AddPrimaryContact implements Queueable {
    private Contact con;
    private String state;
    
    public AddPrimaryContact(Contact con, String state) {
        this.con = con;
        this.state = state;
    }
    
    public void execute(QueueableContext qc) {
        List<Account> accList = [SELECT Id,Name,(SELECT Id,FirstName,LastName FROM Contacts) 
                                 FROM Account 
                                 WHERE BillingState =: state LIMIT 200];
        List<Contact> conList = new List<Contact>();
        for(Account acc: accList) {
            Contact c = con.clone(false,false,false,false);
            c.AccountId = acc.Id;
            conList.add(c);
        }

        if(conList.size() >0) {
            insert conList;
        }
    }

}