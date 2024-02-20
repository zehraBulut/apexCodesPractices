//TASK: endpoint sonuna eklenmis olarak gelen id'ye sahip recordi, body'de gelen bilgiler ile update ediniz

@RestResource(UrlMapping='/account/*')
global class Provider {
        @httpPATCH
    global static Account method01(){        
        RestRequest req = RestContext.request;		
        String filtre= req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);    
        Account acc = [select id , name , rating from account where id=:filtre];        
        Map<String, Object> myMap = (Map<String, Object>) JSON.deserializeUntyped(req.requestBody.toString());        
       acc.name= (String)myMap.get('name');
        acc.Rating=(String)myMap.get('rating');
        update acc;
      //List<Account> accList = [SELECT ID, NAME, Rating FROM ACCOUNT WHERE Rating =:filtre];   
        return acc;     
    }
    
