public class MyContactListController {
    //enables client and server-side access to the controller method
	@AuraEnabled
    public static List<Contact> getContacts(){
    	return [SELECT Id, Name, Email, Title, Phone 
           		FROM Contact];
    }
}