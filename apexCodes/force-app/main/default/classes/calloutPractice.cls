public class calloutPractice {

 // her salesforce a musteri insert ettigimizde bunu gorest e query parametresi olarak gonderip insert eden kodu yaziniz   
 
  @future(callout=true)   
  public static void method3 (String name, String email, String status, String gender){
     
        Http http = new Http ();
        HttpRequest request = new HttpRequest();
       
    
        request.setMethod('POST');                                    
        request.setEndpoint('https://gorest.co.in/public/v2/users?name=' + name + '&email=' + email + '&status=' + status + '&gender=' + gender);
        request.setHeader('Authorization','Bearer 5c1acc8742f1e20f99b32e11a91719f16036d1f421b9a2e7b213885682b9c196');
     	//request.setHeader('Content-Type','application/json; charset=utf-8'); 
     
     HttpResponse response = Http.send(request);
                        
     if(response.getStatusCode()==201){      
           system.debug(response.getBody());           
     }else{     
           system.debug(response.getStatusCode() + 'error');     
     }                       
    
  }
}