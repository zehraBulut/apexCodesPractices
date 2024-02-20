trigger PaymentTrigger on Payment__c (before insert,before update, before delete,after insert, after update, after delete, after undelete) {
           
        if(Trigger.isUpdate && trigger.isBefore){            
            CustomValidationRules.PaymentValidationRules(Trigger.new);                      
            PaymentUtility.FinalPayment(Trigger.new); //paymentla ılgılı method            
    }  
    
    //her paymentta statusu :paid yaptgmzda yenı Income olsması lazım
        if(Trigger.isUpdate && trigger.isAfter){
     
       PaymentTriggerHandler.CreateNewIncome(Trigger.new);   //note:Trigger.newMap.values() == Trigger.new()                            
  }   
}