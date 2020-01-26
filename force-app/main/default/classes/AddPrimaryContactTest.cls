@isTest
public with sharing class AddPrimaryContactTest {
    @isTest
    public static void testMethodOne() {
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<50;i++) {
            accList.add(new Account(name = 'Test Account '+i,BillingState = 'NY'));
        }
        for(Integer i=50;i<100;i++) {
            accList.add(new Account(name = 'Test Account '+i,BillingState = 'CA'));
        }

        insert accList;

        Contact con = new Contact(FirstName = 'Test',LastName = 'Contact');
        insert con;
        String state = 'CA';
        AddPrimaryContact apc = new AddPrimaryContact(con,state);
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();


    }
}
