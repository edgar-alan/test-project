@IsTest
public class AddPrimaryContactTest {
    
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add a parent account
        // 
        for(Integer i =  0; i< 100; i++)
            if(i<50)
        		accounts.add(new Account(name='TestAccount'+i, BillingState = 'NY'));
        	else
				accounts.add(new Account(name='TestAccount'+i, BillingState = 'CA'));                
        
        insert accounts;
    }
    
    static testmethod void testAddPrimaryContactQueueable() {
        AddPrimaryContact addContacts = new AddPrimaryContact(
        	new Contact(FirstName = 'Test', LastName = 'Contact'), 
            'CA'
        );
        
        Test.startTest();        
        System.enqueueJob(addContacts);
        Test.stopTest();
        
        System.assertEquals(50, [select count() from Contact where Account.BillingState =: 'CA']);
    }

}