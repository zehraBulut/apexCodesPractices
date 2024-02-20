public class LeadHandler {
    public static void changeOfName (list<Lead> leadTriggerNew) {
     for(lead ld: leadTriggerNew){
      ld.firstName='Sf. Developer' + ld.firstName;
     }
    }
}