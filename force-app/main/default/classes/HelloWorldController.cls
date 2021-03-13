public with sharing class HelloWorldController {
    
    @AuraEnabled
    public static User getCurrentUser(){
        return [SELECT id, firstname, lastname FROM User WHERE id =: UserInfo.getUserId() LIMIT 1];
    }

}