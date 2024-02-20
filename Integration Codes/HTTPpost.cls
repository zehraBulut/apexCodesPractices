//HTTPpost-->creATE 1 RECORD and send  to PATHtosalesforce

public class customerAPI {
    public static void postCustomer() {
    
  Http http = new Http();
  HttpRequest request = new HttpRequest();  
    request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token=SSSQL8Fy7hOnH9h3yexbh8GVbERzVc1ZgrsBCgHibB6sWgh5aN8TCXa60J9klF3r');
      request.setMethod('POST');
        request.setBody('{"firstName": "Destina", "lastName": "Ozgur","email": "ozgurdestina@gmail.com","phone": "7722996543","gender": "Female","status": "active" }');
          request.setHeader('Content-Type','application/json;charset = UTF-8');
      
             HttpResponse response= http.send(request);  
          
               system.debug(response.getStatusCode());
               system.debug(response.getStatus());
               system.debug(response.getBody());
               
           }    
       }

       /* cagir a.w.dan -->  customerAPI.postCustomer();
        debug: 201-a record created */



        

//HTTPpost--> create more than 1 record  and send to PATHtosalesforce    
         
public static void postCustomer() {          
  public static void postCustomers() {
          
    Http http = new Http();
     HttpRequest request = new HttpRequest();  
       request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token=SSSQL8Fy7hOnH9h3yexbh8GVbERzVc1ZgrsBCgHibB6sWgh5aN8TCXa60J9klF3r');
        request.setMethod('POST');
         request.setBody('[{"firstName": "zaliminoglu", "lastName": "pasat","email": "funny@gmail.com","phone": "7755599893","gender": "male","status": "active" },{"firstName": "enbüyük", "lastName": "besiktas","email": "karakartal@gmail.com","phone": "7722922263","gender": "Female","status": "active" }]');
          request.setHeader('Content-Type','application/json;charset = UTF-8');
            HttpResponse response= http.send(request);  
         
              system.debug(response.getStatusCode());
              system.debug(response.getStatus());
              system.debug(response.getBody());    
          
          
       }   
      }  
 
       /* cagir a.w.dan -->  customerAPI.postCustomers();
        debug: 201- 2records created */