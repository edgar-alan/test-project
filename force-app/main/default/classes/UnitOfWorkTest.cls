@IsTest
public class UnitOfWorkTest {
    
    
    static List<Account> accounts;
    static List<Contact> contacts;
    static List<Note> notes;
    
    @IsTest public static void challengeComplete()
    {
        Test.startTest();
        
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {Account.SObjectType, Note.SObjectType, Contact.SObjectType});
        
        for(Integer i = 0; i <100; i++)
        {
            Account acc = new Account(Name = 'Test Acc'+i);
            uow.registerNew(acc);
            
            for(Integer j = 0; j<5; j++){
                Contact ctct = new Contact(FirstName = ''+i, LastName = 'Test');
                uow.registerNew(ctct, Contact.AccountId, acc);
            }
            
            for(Integer j = 0; j<5; j++){
                Note nt = new Note(Title = ''+i, Body = 'Test');
                uow.registerNew(nt, Note.ParentId, acc);
            }
        }
        
        uow.commitWork();
        
        System.assertEquals(100, [SELECT Id FROM Account].size());
        System.assertEquals(500, [SELECT Id FROM Contact].size());
        System.assertEquals(500, [SELECT Id FROM Note].size());
        
        Test.stopTest();
        
    }
}