public class caseCalloutManager {    
public static VOID caseListesiAllveKaydet(){        
    
    
Http http= new Http();   
HttpRequest request = new HttpRequest();
request.setMethod('GET');  
    
    
//request.setEndpoint('https://triggerproject-dev-ed.develop.my.salesforce.com/services/apexrest/Cases');       
 //request.setHeader('Authorization','Bearer !AQsAQFGq5.FX.jk1_eBSBKzHoVcS4RF3Xm7Gxd.GIrv2PHRA9uQ5OKXjWLBboYWCJmTMo36QbDCsySrOQJyFqQW85lxMc9V6 ');      
 
 //usttekının yerıne named cradentıal ı kulandık...karsı tarafın url ıne grıp ızın alıp onun orguna grmek ıcın ve tokenını grıp bılgılerı cekıcez
   request.setEndpoint('callout:sabahEkibiDersi' + '/Cases'); //yukardakı url ve  token yazmak yerıne named credentıal kulandık
   
    
    HttpResponse response = http.send(request);
     string responseJson=response.getBody();        
   system.debug('responseJson : ' + responseJson);
     system.debug(response.getStatusCode());
    
 /*   karsıdan gelen bılgı bu ama lıste halınde :
  
 {"attributes":{"type":"Case","url":"/services/data/v58.0/sobjects/Case/5008d00000VH4tUAAT"},
"Status":"New",
"Origin":"Phone",
"Subject":"SUBJECTIM DEGISTIIII",
"Priority":"Low","Id":"5008d00000VH4tUAAT"},
 */
    
    
    //ykarakı record bılglerını aldı map yaptı
    //json ı -->  lıste cevırıcez , 
    //objectı map e cevırcez  gelen Lısteyı ıterate edıcem key ımı olusturucam map mantgı ıle
   
    if(response.getStatusCode()==200){   //gelen lıstenın tam olrk ne oldgnu bılmedgm ıcın object olrk alıyrm lıste oldu ve tek tek aldım bılgılerı verdm
    
      List<object> gelenList=(List<object>)JSON.deserializeUntyped(response.getBody());
      List<Case> insertEdilecekRecordlar =new List<Case>();
        for(object obj :gelenList ){
         
            Map<string,Object> tekRecord=  (Map<string,Object>)obj ;
             case yeniCaseRecordu= new Case();
            yeniCaseRecordu .Subject = (string)tekRecord.get('Subject'); 
            yeniCaseRecordu.Priority= (string)tekRecord.get('Priority');
             yeniCaseRecordu.Origin= (string)tekRecord.get('Subject');
             yeniCaseRecordu.Status= (string)tekRecord.get('Status');
            
               insertEdilecekRecordlar.add(yeniCaseRecordu);
            }
          database.insert(insertEdilecekRecordlar);
 
    }else{
        system.debug('hata var kardes' + response.getStatusCode());   
    }

  /*burdakı gbı gecıcı contaıner olusturabılırım ama yapmıcam
   * List<musteriContainer> accFromJson= (List<musteriContainer>)JSON.deserialize(musteriJson, List<musteriContainer>.class); //sobjecte cevrdım
     List<musteri__c> musteriListesi = new List <musteri__c> ();
       for(musteriContainer mst : accFromJson ){
         musteri__c sonMusteri = new musteri__c();
           sonMusteri.Name=mst.name;
           sonMusteri.email__c=mst.email;
           sonMusteri.status__c=mst.status;
           sonMusteri.gender__c=mst.gender;
        musteriListesi.add(sonMusteri);
       }
     insert musteriListesi;      
*/
     
}
   
/*@HttpPost
    global static List<case> doPost() {
        RestRequest request = RestContext.request;
        // asagidaki kisim gelen body icerisinde neler oldugunu gosteriyor
        string gelenBody= RestContext.request.requestBody.toString();
        integer kacDefa = gelenBody.countMatches('attributes');
        system.debug('attributes kacDefa geciyor   ' +  kacDefa);
     system.debug('gelenBody' + gelenBody);
     List<case> caseList =  new List<Case>();
        if (kacDefa == 1 ){
           Map<String, Object> myMap = (Map<String, Object>)JSON.deserializeUntyped(RestContext.request.requestBody.toString());
           system.debug('myMap keyset ::: ' + myMap.keyset());
        Case newCase = new Case ();
        newCase.Subject  = (STRING)myMap.get('Subject');
        newCase.Status   = (STRING)myMap.get('Status');
        newCase.Reason   = (STRING)myMap.get('Reason');
        newCase.Origin   = (STRING)myMap.get('Origin');
        newCase.Priority = (STRING)myMap.get('Priority');
        insert newCase;
        caseList.add(newCase);
        }else if (kacDefa > 1){
                //  eger list olarak bir insert yapilacaksa asagodaki kod gecerli olur
     List<Object> responseList =   ( List<Object>) JSON.deserializeUntyped( RestContext.request.requestBody.toString());
           For(Object obj :   responseList  ) {
               Map<String,Object> myMap= (Map<String,Object>)obj;
                Case newCase = new Case ();
                newCase.Subject  = (STRING)myMap.get('Subject');
                newCase.Status   = (STRING)myMap.get('Status');
                newCase.Reason   = (STRING)myMap.get('Reason');
                newCase.Origin   = (STRING)myMap.get('Origin');
                newCase.Priority = (STRING)myMap.get('Priority');
               caseList.add(newCase);
            }
       Database.insert(caseList);
        }
      return caseList;
    }    
    */
    
}