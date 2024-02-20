public class LeadTriggerHandler {

    public static void convertLead(List<Lead> leadList){
        
        List<Opportunity> oppList = new List<Opportunity>();

          for (Lead l : leadList) {
              
            if (l.IsConverted && l.Rating == 'Hot') {
                
              Opportunity opp = new Opportunity();
              opp.Name = l.Name;
              opp.StageName = 'Prospecting';
              opp.CloseDate = Date.today().addMonths(3);
           //   opp.AccountId = l.AccountId;
              opp.OwnerId = l.ownerId;
              oppList.add(opp);
            }
          }

  insert oppList ; 
    }
    
}