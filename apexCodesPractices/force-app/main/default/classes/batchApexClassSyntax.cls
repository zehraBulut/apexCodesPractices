public class batchApexClassSyntax implements Database.Batchable<sObject> {
 public Database.QueryLocator start(Database.BatchableContext BC){
     
         //string query= 'soql yaz buraya';
        return Database.getQueryLocator('query');
    }
    public void execute(Database.BatchableContext BC, List<Account> acList){
           //codes here
    }   
    
    public void finish(Database.BatchableContext BC){
           //codes here after all batches completed
  }
}