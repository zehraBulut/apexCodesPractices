public class L51contactMain {   
       
    public static void newContacts(Case cs){
        
       List<string> successLogs = new List<string>();
        List<string> errorLogs = new List<string>();               
         try{ 
       
       
             L51contactResponse result = L51contactResponse.parse(cs.Description);
        
        Contact myContact = new Contact();
        myContact.FirstName = result.contact.fName;
        myContact.LastName = result.contact.lName;
        myContact.Email = result.contact.contactEmail;
        myContact.Phone = result.contact.contactPhone;
        myContact.MobilePhone = result.contact.contactMobile;
        myContact.MailingStreet = result.contact.mailingAddress.street;
        myContact.MailingCity = result.contact.mailingAddress.city;
        myContact.MailingState = result.contact.mailingAddress.state;
        myContact.MailingPostalCode = result.contact.mailingAddress.postalCode;    
        myContact.MailingCountry = result.contact.mailingAddress.country;       
        myContact.OtherStreet= result.contact.otherAddress.street;
        myContact.OtherCity= result.contact.otherAddress.street;
        myContact.OtherState= result.contact.otherAddress.street;
        myContact.OtherPostalCode= result.contact.otherAddress.street;
        myContact.OtherCountry= result.contact.otherAddress.street;       
        myContact.Title = result.contact.contactTitle;
        myContact.Level__c = result.contact.contactTitle;
        
        insert myContact;
        }
       
        
      catch(Exception e){
            errorLogs.add(e.getMessage());
            errorLogs.add(string.valueOf(e.getLineNumber()));
            errorLogs.add(string.valueOf(e.getCause()));
            errorLogs.add(e.getStackTraceString());
            
       APILOgUtility.ErrorLog('L51contactMain', errorLogs);  
            
            
        }
    }
}