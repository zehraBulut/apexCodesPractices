public class BatchApexClass implements Database.Batchable<sObject> {
   
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('soql query here');
    }
    public void execute(Database.BatchableContext BC, List<Account> acList){
           //codes here
    }   
    public void finish(Database.BatchableContext BC){
           //codes here after all batches completed
           
  }
    
}