//TASK query parametresi olarak name ve rating gonderip account olusturalim 
@RestResource(UrlMapping='/account/*')
global class provider {
    
   @HttpPOST
    global static Account method04(){          
     RestRequest request= RestContext.request;        
      Account acc =new Account();
        acc.name=request.params.get('name123');
        acc.Rating=request.params.get('rating123');
   insert acc;
  
        return acc;
    }    

