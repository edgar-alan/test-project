public class BatchLeadConvertErrorsHandler {
    
    public static List<BatchLeadConvertErrors__c> convert(List<BatchApexErrorEvent> batchErrors){
        List<BatchLeadConvertErrors__c> leadErrors = new List<BatchLeadConvertErrors__c>();
        for(BatchApexErrorEvent batchError :  batchErrors){
            BatchLeadConvertErrors__c leadError =  new BatchLeadConvertErrors__c(
            	AsyncApexJobId__c = batchError.AsyncApexJobId, 
                Records__c = batchError.JobScope, 
                StackTrace__c = batchError.StackTrace
            );
            leadErrors.add(leadError);
        }
        
        insert leadErrors;
        
        return leadErrors;
        
    }

}