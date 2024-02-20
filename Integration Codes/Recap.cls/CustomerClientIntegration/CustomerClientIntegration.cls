public class CustomerClientRecapIntegration {
	
    
    public static FINAL String END_POINT = 'https://gorest.co.in/public/v2/users'; 
    
    public static FINAL String TOKEN = 'Bearer f0fb965a5ff6a9cd6663a1f3b4c8663f18396ea25183a582afc08524704e838d'; 
    
    // CustomerClientRecapIntegration.getCustomerIdAndSave();
    public static void getCustomerFieldAndSave() {
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint('https://gorest.co.in/public/v2/users');
     		req.setMethod('GET');
        
        HttpResponse res = http.send(req); 
        
        if(res.getStatusCode() == 200){
            
            String customerJson = res.getBody(); 
           
            List<CustomerContainer> CustomerContainer = (List<CustomerContainer>) JSON.deserialize(customerJson, List<CustomerContainer>.class);
            System.debug(CustomerContainer);
           
            List<Customer__c> cusList = new List<Customer__c>(); 
            
            for(CustomerContainer c : CustomerContainer) {
                
                Customer__c cus = new Customer__c(); 
                
                cus.Go_Rest_Id__c = c.id; 
                cus.Name = c.name; 
                cus.email__c = c.email; 
                cus.gender__c = c.gender; 
                cus.status__c = c.status; 
                
                cusList.add(cus); 
            }
           
            insert cusList;  
            
        } else {
            System.debug('GET Method Error is ' + res.getStatusCode());
        }
    }

    
    //============================================
   
    
    // CustomerClientRecapIntegration.postCustomerInsertProvider(); 
    public static void postCustomerInsertProvider(String name, String email, String gender, String Status){
		
        Http http = new Http(); 
        
        HttpRequest req = new HttpRequest();
        
            req.setEndpoint(END_POINT);
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json; charset=utf-8');
            req.setHeader('Authorization', TOKEN);
        	// Post işleminde Id verilmez. 
            string jsonBody = '{"name": "' + name + '",  "email": "' + email + '", "gender": "' + gender + '", "status": "' + Status + '" }';
        	req.setBody(jsonBody);
        
         HttpResponse res = http.send(req);    
        
        if (res.getStatusCode() == 201) {
            String responseBody = res.getBody();
            System.debug('Response: ' + responseBody);
            
        } else {
            System.debug('HTTP Error: ' + res.getStatusCode());
        }
			        
    }
    
    
    //============================================

    
    // CustomerClientRecapIntegration.updateCustomerPatchProvider('3708370'); 
    @future(callout=true) 
    public static void updateCustomerPatchProvider(String id){
  
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users
       	HttpRequest req = new HttpRequest();
        	req.setEndpoint(END_POINT);
       		req.setEndpoint('https://gorest.co.in/public/v2/users/' + id);
     		req.setMethod('PATCH');     
            req.setHeader('Content-Type', 'application/json; charset=utf-8');
            req.setHeader('Authorization', TOKEN);
        	
        	Customer__c cus = [SELECT Go_Rest_Id__c, Name, email__c, gender__c, status__c FROM Customer__c WHERE Go_Rest_Id__c = :id LIMIT 1]; 
        	
			CustomerContainer cc = new CustomerContainer();    
        	cc.name = cus.Name; 
        	cc.email = cus.email__c;
        	cc.gender = cus.gender__c;
        	cc.status = cus.status__c;
        	
        	String jsonBody = JSON.serialize(cc);
        
        	req.setBody(jsonBody);        	
        
        HttpResponse res = http.send(req); 
       System.debug(res);
        if (res.getStatusCode() == 200) {
            String responseBody = res.getBody();
            System.debug('Response: ' + responseBody);
            
        } else {
            System.debug('HTTP Error: ' + res.getStatusCode());
        }
    }
    

//============================================

	
    // CustomerClientRecapIntegration.deleteCustomerDelProvider('3708370');
     @future(callout=true) 
    public static void deleteCustomerDelProvider(String id){
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users/3708370
       	HttpRequest req = new HttpRequest();
        
       		req.setEndpoint(END_POINT + '/' + id);
     		req.setMethod('DELETE');
        	req.setHeader('Authorization', TOKEN);
        
        HttpResponse res = http.send(req);          
        
        //  @future(callout=true) olduğunda gözükmez. 
        if(res.getStatusCode() == 204){
            System.debug('DELETE Method Success is ' + res.getStatusCode());
        } else {
            System.debug('DELETE Method Error is ' + res.getStatusCode());
        }
    }
    
    
    //RecapLesson/done/patch

    public class callout {    
        @future(callout=true)   
         public static void method1(string updateId){
             
                Http ht = new Http ();
                HttpRequest request=new HttpRequest();
               
                request.setEndpoint('https://gorest.co.in/public/v2/users/'+ updateId);
                request.setMethod('PATCH');        
                request.setHeader('Authorization','Bearer 5c1acc8742f1e20f99b32e11a91719f16036d1f421b9a2e7b213885682b9c196');
                 request.setHeader('Content-Type','application/json; charset=utf-8');
          
             
        canerMusteri__c  mstr = [SELECT Id, Name, status__c, email__c, gender__c From canerMusteri__c  where goRestId__c =:updateId LIMIT 1] ;
             
        Container cnt=new Container();
        cnt.name=mstr.name;
        cnt.email=mstr.email__c;
        cnt.status=mstr.status__c;
        cnt.gender=mstr.gender__c;   
             
             
             
             string body = JSON.serialize(cnt);
             request.setBody(body);         
             system.debug(request.getBody());
             
             HttpResponse response = Ht.send(request);
                      
             if(response.getStatusCode()==200){      
             system.debug(response.getBody());           
             }else{     
             system.debug(response.getStatusCode() + 'error');     
             }                       
           }      
        }






} 