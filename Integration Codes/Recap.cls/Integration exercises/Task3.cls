//Gorest ıd sını  org umdakı musterı fıeldındekı recordlardan brının  gorest ıd sı nın yerıne koydum,Org dan delete  yapınca,Goresttende delete olucak
public class callout {    
    @future(callout=true)   
     public static void method1(string deleteId ){
         
            Http ht = new Http ();
            HttpRequest request=new HttpRequest();
           
            request.setEndpoint('https://gorest.co.in/public/v2/users/'+ deleteId);
            request.setMethod('DELETE');        
            request.setHeader('Authorization','Bearer 5c1acc8742f1e20f99b32e11a91719f16036d1f421b9a2e7b213885682b9c196');
         HttpResponse response = Ht.send(request);                                            
         if(response.getStatusCode()==200){        
         system.debug(response.getBody());          
         }else{        
         system.debug(response.getStatusCode() + 'error');                 
         }                  
       }        
    }
    

//Trigger class of callout:
trigger canerMusteriTrigger on canerMusteri__c (after delete) {    
    for(canerMusteri__c  mstr : Trigger.old){      
        callout.method1(mstr.goRestID__c);      
   } 
 }
 