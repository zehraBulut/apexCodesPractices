/* patch methodu UPDATE YADA INSERT YAPAR
   ID Varsa UPDATE YAPIYOR eger yoksa gırılıp bulamadıysa ıd yı  INSERT yapıyor */

 public class customerAPI {  
   public static void PatchCustomer() {   
    Http http = new Http();
     HttpRequest request = new HttpRequest();  
      request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token=SSSQL8Fy7hOnH9h3yexbh8GVbERzVc1ZgrsBCgHibB6sWgh5aN8TCXa60J9klF3r');
       request.setMethod('PATCH');
        request.setBody('{ "id": "44","firstName": "mona", "lastName": "Lisa","email": "monalisa3@gmail.com","phone": "7755509893","gender": "female","status": "active" }');
         request.setHeader('Content-Type','application/json;charset = UTF-8');
          HttpResponse response= http.send(request);  
           system.debug(response.getStatusCode());
           system.debug(response.getStatus());
           system.debug(response.getBody());    
    }     
}

/* INVOKE:  customerAPI.PatchCustomer();
  DEBUG: 200-OK 
  eger ıd yı sıstemde bulamadıysa gırılse bıle,onu ınsert yapar bısonrakı record olrk */


//2.YOL --> parametera  ıd grıp patch yapmak ıstersek ,sdc parameterı ve setEndPoint e 'customerId' eklıcez
public class customerAPI { 
public static void PatchCustomerById(String customerId) {   
    Http http = new Http();
     HttpRequest request = new HttpRequest();  
      request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token=SSSQL8Fy7hOnH9h3yexbh8GVbERzVc1ZgrsBCgHibB6sWgh5aN8TCXa60J9klF3r');
       request.setMethod('PATCH');
        request.setBody('{ "id": "'+customerId+'","firstName": "pathto", "lastName": "salesforce","email": "pathtosalesforcef@gmail.com","phone": "7755509893","gender": "female","status": "active" }');
         request.setHeader('Content-Type','application/json;charset = UTF-8');
          HttpResponse response= http.send(request);  
           system.debug(response.getStatusCode());
           system.debug(response.getStatus());
           system.debug(response.getBody());    
    }        
   }
/* INVOKE:  customerAPI.PatchCustomerById('48');
  DEBUG: 200-OK  UPDATED 48..*/