public class callout {    
@future(callout=true)   
 public static void method1(string updateId){
     
        Http ht = new Http ();
        HttpRequest request=new HttpRequest();
       
        request.setEndpoint('https://gorest.co.in/public/v2/users/'+ updateId);
        request.setMethod('PATCH');        
        request.setHeader('Authorization','Bearer 5c1acc8742f1e20f99b32e11a91719f16036d1f421b9a2e7b213885682b9c196');
     	request.setHeader('Content-Type','application/json; charset=utf-8');
  
     
canerMusteri__c  mstr = [SELECT Id, Name, status__c, email__c, gender__c From canerMusteri__c  where goRestId__c =:updateId LIMIT 1] ;
     
Container cnt=new Container();
cnt.name=mstr.name;
cnt.email=mstr.email__c;
cnt.status=mstr.status__c;
cnt.gender=mstr.gender__c;   
     
     
     
     string body = JSON.serialize(cnt);
     request.setBody(body);         
     system.debug(request.getBody());
     
     HttpResponse response = Ht.send(request);
              
     if(response.getStatusCode()==200){      
     system.debug(response.getBody());           
     }else{     
     system.debug(response.getStatusCode() + 'error');     
     }                       
   }      
}