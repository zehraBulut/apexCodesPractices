trigger LeadTrigger on Lead (before insert,before update,after insert,after update) {

// kayıt update edıldgınde  veya create edıldgınde tum musterı adaylarının adlarının onune 'sf.developer' ekını ekle..

if(trigger.isBefore){
   if(trigger.isInsert){
        LeadHandler.changeOfName(trigger.new);
   }
}
}