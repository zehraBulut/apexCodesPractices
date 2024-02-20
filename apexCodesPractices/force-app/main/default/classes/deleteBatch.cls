public class deleteBatch implements Database.Batchable<sObject>{

       public final String query;
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext BC, List<Account> acList){
          database.delete(acList,false);
    }   
    public void finish(Database.BatchableContext BC){
          
  }
    
    
}