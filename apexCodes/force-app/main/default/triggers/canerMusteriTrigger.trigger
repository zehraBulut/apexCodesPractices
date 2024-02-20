trigger canerMusteriTrigger on canerMusteri__c (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
    
  SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { }
        WHEN BEFORE_UPDATE  { }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   { } 
     
        WHEN AFTER_UPDATE   {
            
         for(canerMusteri__c  mstr:Trigger.new){
       callout.method1(mstr.goRestID__c);     
  } 
   }             
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }      
}
   }