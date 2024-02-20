//TASK:  body de rating fieldini gonderip liste filtrelediginiz kodu yaziniz

@RestResource(UrlMapping='/account/*')
global class provider {
    // rating i endpointin sonunda sadece deger olarak alip,  ilgili ratinge sahip accountlari donen kodu yaziniz    
   @HttpGet
    global static List<account> method04(){          
     RestRequest request= RestContext.request;        
      Map<String ,Object> myMap =( Map<String ,Object>)JSON.deserializeUntyped(request.requestBody.toString());      
      String filtre = (String)myMap.get('Rating');
        List< account>accList = [SELECT ID,name,Rating from Account WHERE Rating =:filtre ];  
        system.debug(accList);
        return accList;
    }    
