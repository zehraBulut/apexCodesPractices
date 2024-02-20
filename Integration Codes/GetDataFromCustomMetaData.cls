/*Custom metadata type:classIN BASINDAKI token  numarasının yerıne methodumu cagrarak kulanabılırım
Home/custom metadata=TokenList/custom fıeld-text-token/manage tokenList-new-PTSAPIToken/token no paste/
Metadata = TokenList__mdt
Label= PTSAPIToken

TokenUtility class oluşturup METADATA dan   TOKEN ı   çağırmak ıcın METHOD olusturucaz…

public class TokenUtility {
    public static String getTokenByLabel(string label){
        TokenList__mdt   mytoken = TokenList__mdt.getInstance(label);
          return   mytoken.token__c;     
    }
}



a.w.cagır:
CustomerAPI.PatchCustomerById('18');
string myToken = TokenUtility.getTokenByLabel('PTSAPIToken');
system.debug(mytoken);

classın en basındakı token numarasının yerıne:
public static final String token='SSSQL8Fy7hOnH9h3yexbh8GVbERzVc1ZgrsBCgHibB6sWgh5aN8TCXa60J9klF3r';
 -->    TokenUtility.getTokenByLabel('PTSAPIToken');

 */

//code is working...




 //Integratıon/class varıable yardımı ıle codelarımızı tekrardan kurtarablrz
public class customerAPI {
     
  public static final String token=TokenUtility.getTokenByLabel('PTSAPIToken'); 
     
     
 //GET methodu ıle record dssardan record aldık orgumuza   
 public static void getCustomers() {        
 Http http = new Http();
  HttpRequest request = new HttpRequest();  
   request.setEndpoint('https://api.pathtosalesforce.com/customerList.php?token='+token);
    request.setMethod('GET');
     HttpResponse response= http.send(request) ;    
         system.debug(response.getStatusCode());
         system.debug(response.getStatus());
         system.debug(response.getBody());       
   }  
     
     
  //1 record karsı tarafta olusturmak ıstersem
 public static void postCustomer() {   
  Http http = new Http();
   HttpRequest request = new HttpRequest();  
    request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
     request.setMethod('POST');
     request.setBody('{"firstName": "enbuyuk", "lastName": "besiktas","email": "kartalca3@gmail.com","phone": "7722933543","gender": "Female","status": "active" }');
      request.setHeader('Content-Type','application/json;charset = UTF-8');
       HttpResponse response= http.send(request);    
         system.debug(response.getStatusCode());
         system.debug(response.getStatus());
         system.debug(response.getBody());
        
     } 
     
      //1 den fazla record baska sıtede olusturmak ıcın
 public static void postCustomers() {   
  Http http = new Http();
   HttpRequest request = new HttpRequest();  
    request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
     request.setMethod('POST');
      request.setBody('[{"firstName": "eslem", "lastName": "kose","email": "funny2@gmail.com","phone": "7755509893","gender": "female","status": "active" },{"firstName": "enbuyuk", "lastName": "besiktas","email": "karatartal2@gmail.com","phone": "7722922263","gender": "Female","status": "active" }]');
       request.setHeader('Content-Type','application/json;charset = UTF-8');
        HttpResponse response= http.send(request);  
         system.debug(response.getStatusCode());
         system.debug(response.getStatus());
         system.debug(response.getBody());    
  }  
     
     
 //karsı sıstemden 1 veya 1 den fazla customer ı sıl:  
  public static void DeleteCustomer() {
  Http http = new Http();
   HttpRequest request = new HttpRequest();  
    request.setEndpoint('https://api.pathtosalesforce.com/customer.php?id=43&token='+token);
     request.setMethod('DELETE');
      HttpResponse response= http.send(request);    
         system.debug(response.getStatusCode());
         system.debug(response.getStatus());
         system.debug(response.getBody());    
  }  
     
     
     //2.delete yolumuz sılmek ıstedıgın recordun ID sını gırmek--> parametera string Id we setEndPoint tekı URL ILE TOKEN ARASINA  'customerId' eklemek   
  public static void DeleteCustomerById(String customerId) {    
   Http http = new Http();
    HttpRequest request = new HttpRequest();  
     request.setEndpoint('https://api.pathtosalesforce.com/customer.php?id='+customerId+'&token='+token);
      request.setMethod('DELETE');
       HttpResponse response= http.send(request);    
         system.debug(response.getStatusCode());
         system.debug(response.getStatus());
         system.debug(response.getBody());     
  }  
     
     
 //put methodu customerların ID sını belırterek pdate edebılırız
 public static void UpdateCustomer() {   
  Http http = new Http();
   HttpRequest request = new HttpRequest();  
    request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token=SSSQL8Fy7hOnH9h3yexbh8GVbERzVc1ZgrsBCgHibB6sWgh5aN8TCXa60J9klF3r');
     request.setMethod('PUT');
      request.setBody('{ "id": "31","firstName": "jenifers", "lastName": "Lops","email": "jenilops2@gmail.com","phone": "7755509893","gender": "female","status": "active" }');
       request.setHeader('Content-Type','application/json;charset = UTF-8');
        HttpResponse response= http.send(request);  
         system.debug(response.getStatusCode());
         system.debug(response.getStatus());
         system.debug(response.getBody());    
  }   
 
   // ID gırerekte update yapablrsnız:  
  public static void UpdateCustomerById(String customerId ) {   
  Http http = new Http();
   HttpRequest request = new HttpRequest();  
    request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token=SSSQL8Fy7hOnH9h3yexbh8GVbERzVc1ZgrsBCgHibB6sWgh5aN8TCXa60J9klF3r');
     request.setMethod('PUT');
      request.setBody('{ "id": "'+customerId+'","firstName": "sandra", "lastName": "Blok","email": "sandroblok@gmail.com","phone": "7755509893","gender": "female","status": "active" }');
       request.setHeader('Content-Type','application/json;charset = UTF-8');
        HttpResponse response= http.send(request);  
         system.debug(response.getStatusCode());
         system.debug(response.getStatus());
         system.debug(response.getBody());    
  }      
     
  /* patch methodu UPDATE YADA INSERT YAPAR
    ID Varsa UPDATE YAPIYOR eger yoksa gırılıp bulamadıysa ıd yı  INSERT yapıyor */
   public static void PatchCustomer() {   
  Http http = new Http();
   HttpRequest request = new HttpRequest();  
    request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
     request.setMethod('PATCH');
      request.setBody('{ "id": "99","firstName": "patch", "lastName": "put","email": "patchput@gmail.com","phone": "7755509893","gender": "female","status": "active" }');
       request.setHeader('Content-Type','application/json;charset = UTF-8');
        HttpResponse response= http.send(request);  
         system.debug(response.getStatusCode());
         system.debug(response.getStatus());
         system.debug(response.getBody());    
  }     
 //parametera  ıd grıp patch yapmak ıstersek ,sdc parameterı ve setEndPoint e customerId eklıcez
 public static void PatchCustomerById(String customerId) {   
  Http http = new Http();
   HttpRequest request = new HttpRequest();  
    request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
     request.setMethod('PATCH');
      request.setBody('{ "id": "'+customerId+'","firstName": "pathto", "lastName": "salesforce","email": "pathtosalesforcef@gmail.com","phone": "7755509893","gender": "female","status": "active" }');
       request.setHeader('Content-Type','application/json;charset = UTF-8');
        HttpResponse response= http.send(request);  
         system.debug(response.getStatusCode());
         system.debug(response.getStatus());
         system.debug(response.getBody());    
  }     
  
 }
