/*create contacts to my org from response class (Response class oluşturduk get recordları sf  a donusturup sonra onları contacta cevırmek ICIN,
RESULT OLRK  Karsı sıstemdekı tum contactları kendı orguma aldımmm!!!) */


//response class:
public class CustomerResponse {   
public string firstName;
public string lastName;    
public string email;    
public string phone;    
public string gender;
public string status;    
    public static List<CustomerResponse>  parse (String json){        
        return  (List<CustomerResponse>)  System.JSON.deserialize(json,  List<CustomerResponse>.class);      
    }      
}
 

//methodu kulandgım main class:
public class customerAPI {
public static void getCustomersByResponse() {        
Http http = new Http();
 HttpRequest request = new HttpRequest();  
  request.setEndpoint('https://api.pathtosalesforce.com/customerList.php?token='+token);
   request.setMethod('GET');
    HttpResponse response= http.send(request) ;    
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());  //burası bızım JSONımız
    
      List<CustomerResponse> customers = CustomerResponse.parse(response.getBody());   //(JSON liste formatına geldı)
      List<contact> conList=new  List<contact>();  
      for(CustomerResponse   customer : customers){
        
           contact con =new contact();   
           con.FirstName=customer.FirstName;
           con.LastName=customer.LastName;
           con.Email=customer.email;
           con.Phone=customer.phone;
           
           conList.add(con); 
        }
     insert conList;  
  }     
}
// INVOKE-->  customerAPI.getCustomersByResponse();
//ALL contacts are  inserted..yess!!!
