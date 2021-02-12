@RestResource(urlMapping = '/Accounts/*')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount()
    {
        Account acc = new Account();
        
        RestRequest request =  RestContext.request;
        String[] uriParts =  request.requestURI.split('/');
        Id recId = uriParts[uriParts.size()-2];
        System.debug(request.requestURI);
        System.debug(uriParts);
        
        for(Account a :  [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account Where Id =: recId])
        {
        	acc = a;   
        }
        
        return acc;
    }
}