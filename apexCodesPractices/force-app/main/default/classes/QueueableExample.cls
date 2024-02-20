public class QueueableExample implements Queueable {

    public void execute ( QueueableContext QC){
     
  List<Account> acList = new  List<Account>();
       for (Integer i=1; i<=10; i++){
    
  Account ac= new Account(Name = 'test account ' + i);
       acList.add(ac);
        
       }
     insert acList;
    } 
}