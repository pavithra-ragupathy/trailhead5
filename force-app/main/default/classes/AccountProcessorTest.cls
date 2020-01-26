@isTest
public class AccountProcessorTest {
    
    @isTest
    public static void testMethodOne() {
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'User1';
        con.AccountId = acc.Id;
        insert con;
        
        Contact con1 = new Contact();
        con1.FirstName = 'Test';
        con1.LastName = 'User2';
        con1.AccountId = acc.Id;
        insert con1;
        
        Test.startTest();
        List<Id> accList = new List<Id>();
        accList.add(acc.Id);
        AccountProcessor.countContacts(accList);
        Test.stopTest();
        
        Account accValue = [SELECT id,Number_of_Contacts__c FROM Account WHERE Id =:accList LIMIT 1];
        
        System.assertEquals(2, accValue.Number_of_Contacts__c);
        
    }

}