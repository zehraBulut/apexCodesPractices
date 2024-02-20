public class L51testContactFromSR{

    public static void testContact(){
        
         StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'contact'  LIMIT 1];
        
        L51testContactFromSRjson result = (L51testContactFromSRjson)JSON.deserialize(sr.Body.toString() , L51testContactFromSRjson.class);
        
        Contact contact = result.contact;
        insert contact;      
    }    
}