@IsTest
public class LeadProcessorTest {

    @TestSetup
    static void setup()
    {
        List<Lead> testLeads = new List<Lead>();
        
        for(Integer i = 0; i< 200; i++)
        {
            testLeads.add(new Lead(FirstName ='Lead ', LastName = ''+i, Company = 'C'+i));
        }
        insert testLeads;
    }
    
    @IsTest
    public static void LeadSource_test()
    {
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}