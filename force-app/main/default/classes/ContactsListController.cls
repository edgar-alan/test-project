public class ContactsListController {

    @AuraEnabled
    public static List<Contact> getAccountContacts(Id accId)
    {
        List<Contact> accContacts = new List<Contact>();
        
        for(Contact c : [SELECT Id, FirstName, LastName, MobilePhone, Email, AccountId, Languages1__c FROM Contact WHERE AccountId =: accId])
        {
            accContacts.add(c);
        }
        
        return accContacts;
    }
    @AuraEnabled
    public static void saveList(List<Contact> accContacts)
    {
        update accContacts;
    }
}