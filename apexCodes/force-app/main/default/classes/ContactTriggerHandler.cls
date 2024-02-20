public  class ContactTriggerHandler {
    public static void updateContactPhone(List<contact> conTriggerList) {
      //account ıd lerını set te topla:
      set<Id> accIds = new set<Id>();
         for(contact con: conTriggerList){
      
            if(con.AccountId !=null){
            accIds.add(con.AccountId);
           }

         }
//soql ıle acccountların recorldarına ulas
 List<account>accList =[SELECT Id,phone from account WHERE Id IN :accIds];   
//update etmek ıcın map lıstesı olustrrm
 if(!accList.isEmpty()){

    map<Id,Account> accMap = new map<Id,Account>();
    for( account ac :accList){
    accMap.put(ac.Id,ac);
    }
   // contact lstesının ıcıne grıp  update yap
for(contact con : conTriggerList){
if(con.accountId != null){
con.OtherPhone = accMap.get(con.accountId).phone;
}

}



    }
 }
}