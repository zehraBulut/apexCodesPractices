trigger ContactTrigger on Contact (before insert,before update,after insert,after update) {
//ACcounta baglı yeni contact create edıldgınde Account un phone u contactın other phone u olrk belırlensın

if(trigger.isBefore && trigger.isInsert){

    ContactTriggerHandler.updateContactPhone(trigger.new);
}

}