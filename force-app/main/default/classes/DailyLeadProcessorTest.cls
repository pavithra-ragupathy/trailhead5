@isTest
public with sharing class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 1 * * ?';
    @isTest
    public static void testScheduleJob() {
        List<lead> l = new List<lead>();
        for(Integer i=0;i<200;i++) {
            l.add(new Lead(Name = 'Lead '+i ));
        }
        insert l;

        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        System.assertnotEquals(null,l,'Not null');
        System.assertEquals(200,[SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);

    }
}
 