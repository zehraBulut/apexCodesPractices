//send contact(s) to  endPoint  :(var olan  contactları alıp karsı tarafa gonderıcez)



//CUSTOMER CLASS:
public class CustomerRequest {    
public string firstName;
public string lastName;    
public string email;    
public string phone;    
public string gender;
public string status;    
}    


public class customerAPI {
public static void PostCustomerFromContacts(){      
    List<contact> conList = [SELECT Id,LastName, phone, Email FROM Contact];    
    List<CustomerRequest>  customerList = new List<CustomerRequest>();    
    for(Contact con : conList){
    CustomerRequest  customer = new CustomerRequest();    

    customer.lastName=con.lastName;
    customer.email=con.email;
    customer.phone=con.phone;
    customerList.add(customer);
    
 }
 Http http = new Http();
  HttpRequest request = new HttpRequest();  
   request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
    request.setMethod('POST');
    request.setBody(JSON.serialize(customerList));
     request.setHeader('Content-Type','application/json;charset = UTF-8');
      HttpResponse response= http.send(request);    
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());   
    }      
}

// customerAPI.PostCustomerFromContacts();
