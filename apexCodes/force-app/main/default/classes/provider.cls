@RestResource(UrlMapping='/account/*')
global class provider {
  // endpoint sonuna eklenmis olarak gelen id'ye sahip recordi, body'de gelen bilgiler ile update edinizz

     @httpPATCH
    global static Account method01(){
        
        RestRequest req = RestContext.request;
		
        String filtre= req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
        Account acc = [select Id , name , rating from account where Id=:filtre];
        
        Map<String, Object> myMap = (Map<String, Object>) JSON.deserializeUntyped(req.requestBody.toString());
        
       acc.name= (String)myMap.get('name');
        acc.Rating=(String)myMap.get('rating');
        update acc;
     
        
    
  
        return acc;
    }    
}