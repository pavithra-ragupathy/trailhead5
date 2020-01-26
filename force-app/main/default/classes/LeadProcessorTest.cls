@isTest
public class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> Leads = new List<Lead>();
        for(Integer i=0; i <100; i++) {
            Leads.add(new Lead(LastName='Lead '+i, 
                Company='Lead', Status='Open - Not Contacted'));
        }
        insert Leads;
    }
    
    static testmethod void test() {
        Test.startTest();
        LeadProcessor lp =new LeadProcessor();
        Id BatchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals([select count() from Lead Where LeadSource='Dreamforce'], 100);
    }
}