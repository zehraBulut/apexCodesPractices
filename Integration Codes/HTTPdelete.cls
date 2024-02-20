 //karsı sıstemden 1 veya 1 den fazla customer ı delete:
   
public class customerAPI {
public static void DeleteCustomer() {
    
    Http http = new Http();
    HttpRequest request = new HttpRequest();  
    request.setEndpoint('https://api.pathtosalesforce.com/customer.php?id=43&token=SSSQL8Fy7hOnH9h3yexbh8GVbERzVc1ZgrsBCgHibB6sWgh5aN8TCXa60J9klF3r');
    request.setMethod('DELETE');
    
     HttpResponse response= http.send(request);  
      
           system.debug(response.getStatusCode());
           system.debug(response.getStatus());
           system.debug(response.getBody());    
    
    }  

    /*INVOKE :  customerAPI.DeleteCustomer();
    debug:  s.code 202-deleted */


/* 2.YOL: karsı skıstemden  sılmek ıstedıgın recordun strinle  ID sını gırmek
--> parametera string Id we setEndPoint tekı URL ILE TOKEN ARASINA  'customerId' eklemek */
    
 public static void DeleteCustomerById(String customerId) {
    
    Http http = new Http();
    HttpRequest request = new HttpRequest();  
    request.setEndpoint('https://api.pathtosalesforce.com/customer.php?id='+customerId+'&token=SSSQL8Fy7hOnH9h3yexbh8GVbERzVc1ZgrsBCgHibB6sWgh5aN8TCXa60J9klF3r');
    request.setMethod('DELETE');
    
    HttpResponse response= http.send(request);  
      
           system.debug(response.getStatusCode());
           system.debug(response.getStatus());
           system.debug(response.getBody());    
    
    }          
}

 /*  ınvoke:customerAPI.DeleteCustomerById('42');
 debug:202-deleted */



    