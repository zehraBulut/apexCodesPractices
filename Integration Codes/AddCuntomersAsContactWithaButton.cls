//ADD CUSTOMERS AS CONTACT WITH A BUTTON(INVOKE CLASS OLUSTRCAZ VE FLOW ILE YAPICAZ

//1)create CustomerInvocable

    public class CustomerInvocable{
    @InvocableMethod(label='Get Customers')
    public static void CallAPI(){     
        customerAPI.getCustomersByResponse();  
          
    }
}


//2) and create maın class   

public class customerAPI @future(Callout=true)
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
