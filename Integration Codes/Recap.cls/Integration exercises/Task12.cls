//TASK:   query parametre olarak id gonderip, body de gonderdigimiz bilgiler ile update islemi yaptigimiz provider classi yaziniz

@RestResource(UrlMapping='/account/*')
global class provider {
  // query parametre olarak id gonderip, body de gonderdigimiz bilgiler ile update islemi yaptigimiz provider classi yaziniz

    
   @HttpPATCH
    global static Account method04(){          
     RestRequest request= RestContext.request;  
      string filtre=request.params.get('Id');  

      Account acc =[SELECT Id,name,rating from account where Id =:filtre];
       Map<String,Object> myMap = (Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());
        acc.name=(String)myMap.get('name');
        acc.Rating=(String)myMap.get('rating');
   update acc;
  
        return acc;
    }    
