@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {
	
    @HttpPost
    global static void closeCase(String reason)
    {
        String[] uriParts = RestContext.request.requestUri.split('/');
        Id caseId = uriParts[2];
        
        CaseService.closeCases(new Set<Id>{caseId}, reason);
        
    }
    
}