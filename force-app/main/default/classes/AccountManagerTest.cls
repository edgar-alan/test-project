@IsTest
public class AccountManagerTest {

    @IsTest public static void getAccount_test()
    {
        Account acc =  new Account(Name = 'Test Acc');
        insert acc;
        
        Contact ctct =  new Contact(LastName = 'Contact', FirstName = 'Test', AccountId = acc.Id);
        insert ctct;
        
        RestRequest request =  new RestRequest();
        request.requestURI =  URL.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Accounts/'+acc.Id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        
        System.debug(request.requestURI);
        
        Test.startTest();
        
        AccountManager.getAccount();
        
        Test.stopTest();
        
    }
}