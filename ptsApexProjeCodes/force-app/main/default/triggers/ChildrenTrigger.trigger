trigger ChildrenTrigger on Children__c (before insert,before update, before delete,after insert, after update, after delete, after undelete) {
    
   
     if((Trigger.isInsert && Trigger.isBefore) || (Trigger.isUpdate && Trigger.isBefore)){
        
       CustomValidationRules.ChildValidationRule(Trigger.new);
       
     }  
}