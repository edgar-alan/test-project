public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> accIds)
    {
        List<Account> accounts = new List<Account>();
        for(Account a : [SELECT Id, Name,
                         (SELECT Id, Name FROM Contacts)
                         FROM Account WHERE Id IN :accIds])
        {
            a.Number_of_Contacts__c = a.Contacts.size();
            accounts.add(a);
        }
        update accounts;
    }
}