public with sharing class MyPropertyController {
    /*@AuraEnabled
    public static List<Property__c> findProperties (Id recordId, Decimal priceRange) {
        List<Property__c> property = [SELECT Price__c FROM Property__c WHERE Id=:recordId];
        Decimal propertyPrice = property[0].Price__c;
        List<Property__c> similarProperties = getSimilarProperties(recordId, priceRange, propertyPrice, 2);
        return similarProperties;
    }*/
    @AuraEnabled
    public static List<Property__c> getSimilarProperties (Id recordId, String searchCriteria, Decimal beds, Decimal price, Decimal priceRange) {
        List<Property__c> similarProperties = new List<Property__c>();
        if (searchCriteria == 'Bedrooms') {
            similarProperties = [SELECT Id, Name, Beds__c, Baths__c, Price__c, Broker__c, Status__c, 
                                    Thumbnail__c
                                FROM Property__c
                                WHERE Id !=: recordId AND Beds__c =: beds];
        } else {

            Decimal range = (priceRange == null) ? 100000 : priceRange;
            similarProperties = [
                SELECT Id, Name, Beds__c, Baths__c, Price__c, Broker__c, Status__c, Thumbnail__c
                FROM Property__c WHERE Id != :recordId AND Price__c > :price - range AND Price__c < :price + range
            ];
        }

        return similarProperties;
    }
}