//TASK:  Bir liste insert edildiginde gorest'e de liste olarak insert eden kodu yaziniz
public class callout {
    @future(callout=true)
 public static void method01(List<ID> insertId ){
     Http http = new Http();
     HttpRequest req = new HttpRequest();        
     req.setMethod('POST');
     req.setEndpoint('https://gorest.co.in/public/v2/users/');
     req.setHeader('Authorization', 'Bearer 278bdbf8d35590c0a73333ed5c7d5832108e2b737a8be6b5840fd10bf8a5532d');    
     List<Musteri__c> mstList = [SELECT ID, NAME , EMAIL__C, GENDER__C, STATUS__C FROM MUSTERI__C WHERE ID=:insertId];
     List<Container> newList = new List<Container>();        
     for(mUsteri__c mst: mstList){
     Container cnt = new Container();        
     cnt.name= mst.name;
     cnt.email=mst.email__c;
     cnt.status=mst.status__c;
     cnt.gender=mst.gender__c;      
     newList.add(cnt);    
     }
     String jsonSyntax= JSON.serialize(newList);
     req.setBody(jsonSyntax);
HttpResponse resp = Http.send(req);
     if(resp.getStatusCode()==201){            
         system.debug(resp.getBody());
     }else{    
         system.debug(resp.getStatusCode()+ '  error' );
     }
 }}

 //Trigger of callout:
 trigger MusteriTrigger on Musteri__c (after insert) {
    List<Id> newList = new List<Id>();
     for(Musteri__c mst : Trigger.new){      
         newList.add(mst.id);        
     }
    callout.method01(newList);
 }
 