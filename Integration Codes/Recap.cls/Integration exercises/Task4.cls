//her salesforce a musteri insert ettigimizde bunu gorest e query parametresi olarak gonderip insert eden kodu yaziniz
public class callout {
    @future(callout=true)
 public static void method01(String name, String email, String status, String gender){
// her salesforce a musteri insert ettigimizde bunu gorest e query parametresi olarak gonderip insert eden kodu yaziniz
     Http http = new Http();
     HttpRequest req = new HttpRequest();        
     req.setMethod('POST');
     req.setEndpoint('https://gorest.co.in/public/v2/users?name='+ name +'&email='+email+'&status='+ status+'&gender='+gender);
     req.setHeader('Authorization', 'Bearer 278bdbf8d35590c0a73333ed5c7d5832108e2b737a8be6b5840fd10bf8a5532d');        
     HttpResponse resp = Http.send(req);
     if(resp.getStatusCode()==201){           
         system.debug(resp.getBody());
     }else{         
         system.debug(resp.getStatusCode()+ '  error' );
     }
 }}

 //Trigger of callout:
 trigger MusteriTrigger on Musteri__c (after insert) {  
    for(Musteri__c mst : Trigger.new){     
        callout.method01(mst.name, mst.email__c, mst.status__c, mst.gender__c);        
    }   
