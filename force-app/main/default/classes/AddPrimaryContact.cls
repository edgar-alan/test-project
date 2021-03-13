public class AddPrimaryContact implements Queueable{

    
    private Contact addContact;
    private String state;
    
    public AddPrimaryContact(Contact addContact, String state){
        this.addContact = addContact;
        this.state = state;
    }
    
    public void execute (QueueableContext context){
    	List<Id> accIds = new List<Id>();
        
        for(Account a: [SELECT Id FROM Account 
                        WHERE BillingState =: this.state
                       LIMIT 200])
        {
            accIds.add(a.Id);
        }
        
        
        List<Contact> contacts = new List<Contact>();
        
        for(Id accId : accIds)
        {
            Contact clonedContact = addContact.clone(false, false, false, false);
            clonedContact.AccountId = accId;
            contacts.add(clonedContact);
        }
        
        insert contacts;
        
    }
}