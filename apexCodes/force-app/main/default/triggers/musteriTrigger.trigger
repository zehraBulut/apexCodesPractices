trigger musteriTrigger on canerMusteri__c (after update) {
          for(canerMusteri__c  mstr : Trigger.new){
        calloutPractice2.method3 (mstr.name, mstr.email__c , mstr.status__c, mstr.Gender__c); 
       } 
}