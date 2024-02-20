//HER SF TA MUSTERI   INSERT  ETGMZDE  BUNU goRESTE QUERY  PARAMETRESI OLARAK  INSERT EDEN  code'u YAZ..
public class callout {
@future(callout=true)   
 public static void method1(string name,string email,string status,string gender){
        Http ht = new Http ();
        HttpRequest request=new HttpRequest();
       
        request.setEndpoint('https://gorest.co.in/public/v2/users?name=' + name + '&email=' + email + '&status='+ status + '&gender=' + gender);
        request.setMethod('POST');        
        request.setHeader('Authorization','Bearer 5c1acc8742f1e20f99b32e11a91719f16036d1f421b9a2e7b213885682b9c196');
       
     HttpResponse response = Ht.send(request);
                            
       String body=  Response.getBody(); 
     if(response.getStatusCode()==201){
         system.debug(response.getBody());  
     }else{
        system.debug(response.getStatusCode() + 'error'); 
     }                                        
   }    
}

//Trigger_Class of callout:

trigger canerMusteriTrigger on canerMusteri__c (after insert) {
    for(canerMusteri__c  mstr:Trigger.new){
        callout.method1(mstr.name,mstr.email__c,mstr.status__c,mstr.gender__c);  
    } 
}
