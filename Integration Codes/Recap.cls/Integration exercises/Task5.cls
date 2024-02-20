: // 1 adet salesforce'a musteri record Insert edildiginde, bilgileri body de gondererek yine 1 adet goRest recordi olusturan kodu yaziniz
public class callout {
    @future(callout=true)
 public static void method01(ID insertId){
     Http http = new Http();
     HttpRequest req = new HttpRequest();      
     req.setMethod('POST');
     req.setEndpoint('https://gorest.co.in/public/v2/users');
     req.setHeader('Authorization', 'Bearer 278bdbf8d35590c0a73333ed5c7d5832108e2b737a8be6b5840fd10bf8a5532d');      
     Musteri__c mst = [SELECT ID, NAME , EMAIL__C, GENDER__C, STATUS__C FROM MUSTERI__C WHERE ID=:insertId];        
     Container cnt = new Container();        
     cnt.name= mst.name;
     cnt.email=mst.email__c;
     cnt.status=mst.status__c;
     cnt.gender=mst.gender__c;    
     String  jsonSyntax= JSON.serialize(cnt);
     req.setBody(jsonSyntax);           
     HttpResponse resp = Http.send(req);
     if(resp.getStatusCode()==201){         
         system.debug(resp.getBody());
     }else{       
         system.debug(resp.getStatusCode()+ '  error' );
     }
 }}

//Trigger of callout

trigger MusteriTrigger on Musteri__c  (before insert , before update , before delete , after insert , after update, after delete, after undelete) {   
    SWITCH on Trigger.operationType {    
          WHEN BEFORE_INSERT  { }
          WHEN BEFORE_UPDATE  { }
          WHEN BEFORE_DELETE  { }
  
          WHEN AFTER_INSERT   {
    for(Musteri__c mst : Trigger.new){
          
          callout.method01(mst.ID);
          
      }  
   } 
          WHEN AFTER_UPDATE   {  }             
          WHEN AFTER_DELETE   { }
          WHEN AFTER_UNDELETE { }         
  } 
   }
  
