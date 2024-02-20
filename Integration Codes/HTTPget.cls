//INTEGRATİON-HTTP Methods/ GET  (FROM PATHtosalesforce to my Org)

public class customerAPI {
  
  public static void getCustomers() {
        
    Http http = new Http();
     HttpRequest request = new HttpRequest();  
      request.setEndpoint('https://api.pathtosalesforce.com/customerList.php?token=SSSQL8Fy7hOnH9h3yexbh8GVbERzVc1ZgrsBCgHibB6sWgh5aN8TCXa60J9klF3r');
       request.setMethod('GET');
        HttpResponse response= http.send(request) ;  
   
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
        system.debug(response.getBody());
        
    }  
}


/* INvoke: customerAPI.getCustomers();
debug:200-Json modda*/
