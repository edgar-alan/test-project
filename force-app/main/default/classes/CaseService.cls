public class CaseService {
    
    public static void closeCases(Set<Id> caseIds, String closeReason)
    {
        List<Case> closedCases = new List<Case>();
        for(Case c : [SELECT Id, Status FROM Case WHERE id IN: caseIds])
        {
            c.Status = 'Closed';
            c.Reason = closeReason;
            closedCases.add(c);
        }
        update closedCases;
        
    }

}