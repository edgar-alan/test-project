@IsTest
public class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 5 14 * * ?'; 
    //Fire every minute starting at 2:00 PM and ending at 2:05 PM, every day
    //https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm
    
    @testSetup 
    static void setup() {
        List<Lead> testLeads = new List<Lead>();
        
        for(Integer i = 0; i< 200; i++)
        {
            testLeads.add(new Lead(FirstName ='Lead ', LastName = ''+i, Company = 'C'+i));
        }
        insert testLeads;
    }
    
    @IsTest
    static void testDailyLeadProcessor() {
        
        Test.startTest();
        String jobId = System.schedule('DailyLeadProcessor', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce'], 'There are not 200 Leads from Dreamforce');
    }
}