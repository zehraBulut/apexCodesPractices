/***************************************************************************************
File Name:   PTSEmailInv

Summary: Send Email to Contacts with Button using Metadata   &&  Invocable methods is used

***************************************************************************************
Zehra Bulut - 11/12/2023 - Story 20  || Mass Email Contacts.
**************************************************************************************/

public class PTSEmailInv {
    
    public class request{
         @InvocableVariable(Label='PTS Email Subject')
        public String emailSubject;
        
         @InvocableVariable(Label='PTS Email Body')
        public String emailBody;
        
         @InvocableVariable(Label='PTS Email List')
        public List<String> emailList;
     
    }
    
  //Notes:Invocable methods accept only Lists!!!
    @InvocableMethod(Label='PTS Send Email Integration')
     public static void SendEmail(List<request>params){
               
       PTSEmail.sendEmail(params[0].emailSubject ,params[0].emailBody ,params[0].emailList);

        
    }
}