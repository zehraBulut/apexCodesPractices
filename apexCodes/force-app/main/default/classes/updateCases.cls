public class updateCases implements Database.Batchable<SObject>{
    
    public final String query;
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext BC, List<case> scope){
       for(Case cs : scope){
            if(cs.Status=='New'){
                cs.Priority='High';
            }
        }
        update scope;
        
    }   
    public void finish(Database.BatchableContext BC){
        
  AsyncApexJob job = [select Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
                      From AsyncApexJob where Id = : bc.getJobId() ];
        
   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
   String[] toAddress = new String[]{job.CreatedBy.Email};
   mail.setToAddresses(toAddress);
   mail.setSubject('Apex job Status' + job.Status);
   mail.setPlainTextBody('The apex job processed ' + job.TotalJobItems + ' Batches with ' + job.NumberOfErrors + ' failures');
   Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});   
  }  
}