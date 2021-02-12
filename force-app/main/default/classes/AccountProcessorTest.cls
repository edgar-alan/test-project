@IsTest
public class AccountProcessorTest {

    
    public static testMethod void  countContacts_test()
    {
        Account testAccount = new Account(Name = 'Name');
        insert testAccount;
        Contact testContact = new Contact(FirstName = 'Test', LastName = 'Contact', AccountId = testAccount.Id);
        insert testContact;
        
        Test.startTest();
        
        AccountProcessor.countContacts(new List<Id> {testAccount.Id});
        
        Test.stopTest();
    }
}