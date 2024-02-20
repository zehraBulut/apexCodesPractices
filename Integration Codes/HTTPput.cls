//put methodu customerların ID sını belırterek pdate edebılırız

public class customerAPI {
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
}

  /*  INVOKE:  customerAPI.UpdateCustomer();
  DEBUG:201-UPDATED  */




   // ID gırerekte update yapablrsnız:
   
public class customerAPI {
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
}

/*INVOKE: customerAPI.UpdateCustomerById('32');
DEBUG: 201-Updated*/ 