public class BatchAccountStateFulExample  implements Database.Batchable <Sobject>, Database.Stateful {
public Decimal AR = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
    String query = 'Select Id from Account';
      return Database.getQueryLocator(query);   
}
    public void execute(Database.BatchableContext bc, List<SObject> scope) {
    for(sobject s :scope) {
      AR+=1;
    }
  }
  public void finish(Database.BatchableContext bc) {
    
    Account ac = new Account(Name='Batch Apex Stateful');
    ac.AnnualRevenue = AR;
    insert ac;
      
  }
}