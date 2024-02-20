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
    request.setBody('{"firstName": "yorgunsanavci", "lastName": "termianorum","email": "termi@gmail.com","phone": "7722933543","gender": "Female","status": "active" }');
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
   
    
    
    //calısmadı
 public static void PostCustomerFromSR() {   
  StaticResource sr = [SELECT Id, body FROM StaticResource WHERE name='Customers'];
    
String payload = sr.body.toString();

 Http http = new Http();
  HttpRequest request = new HttpRequest();  
   request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
    request.setMethod('POST');
    request.setBody(payload);
     request.setHeader('Content-Type','application/json;charset = UTF-8');
      HttpResponse response= http.send(request);    
       
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());
       
    } 
  
    
    
  public static void PostCustomerFromRequest() {   
    CustomerRequest  customer = new CustomerRequest();
    customer.firstName='wilims';
    customer.lastName='wilsan';
    customer.email='wills8@gmail.com';
    customer.gender='male';
    customer.phone='8877665544';
    customer.status='active';
        

 
 Http http = new Http();
  HttpRequest request = new HttpRequest();  
   request.setEndpoint('https://api.pathtosalesforce.com/customer.php?token='+token);
    request.setMethod('POST');
    request.setBody(JSON.serialize(customer));
     request.setHeader('Content-Type','application/json;charset = UTF-8');
      HttpResponse response= http.send(request);    
       
        system.debug(response.getStatusCode());
        system.debug(response.getStatus());
        system.debug(response.getBody());   
    } 
    
    
    
public static void PostCustomersFromRequest() { 
    
   List<CustomerRequest>  customerList = new List<CustomerRequest> ();
    
    
    CustomerRequest  customer1 = new CustomerRequest();
    customer1.firstName='andrean';
    customer1.lastName='toms';
    customer1.email='andrTo@gmail.com';
    customer1.gender='female';
    customer1.phone='8877665544';
    customer1.status='active';
    
    
    CustomerRequest  customer2 = new CustomerRequest();
    customer2.firstName='zeyno';
    customer2.lastName='bas';
    customer2.email='zeynepbastik9@gmail.com';
    customer2.gender='female';
    customer2.phone='8877665544';
    customer2.status='active';
  customerList.add(customer1);
  customerList.add(customer2);  
    
 //busekılde gonderılemez serialize yapmak lazım
  
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
    
   
    //send contact(s) to  endPoint(bu calısmadı bende!!)
  public static void PostCustomerFromContacts(){      
    List<contact> conList = [SELECT Id,LastName, phone, Email FROM Contact];    
    List<CustomerRequest>  customerList = new List<CustomerRequest>();    
    for(Contact con : conList){
    CustomerRequest  customer = new CustomerRequest();    
              customer.email=con.Email;
               customer.lastName=con.LastName;
                 customer.phone=con.Phone;
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
 
  /* BUNU CUSTOMER CLASS OLUSTURUP TUM CUSTOMERDA OLSTRDGMZ CONTACT LARI BIR BUTTON OLUSTURARAK YUKLEYEBILCEZ ORG A  FLOW ILE..
   * @future(Callout=true)
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
  }   */
    
    
    
    
    
   
}