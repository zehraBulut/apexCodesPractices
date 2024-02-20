/*TASK:TASK:   query   parametre  olarak   gonderilen   bilgiyi   kullanarak filtreleme   işlemi   yapiniz
YANI asagda gordgun code u yazıcam*/


@RestResource(UrlMapping='/account/*')
global class provider {  
    // rating i endpointin sonunda sadece deger olarak alip,  ilgili ratinge sahip accountlari donen kodu yaziniz
    // https://wisequarter-13c-dev-ed.develop.my.salesforce.com/services/apexrest/account/rathot    
   @HttpGet
    global static List<account> method04(){
     RestRequest request=restContext.request;
      String filtre = request.params.get('rating');
        List< account>accList = [SELECT ID,name,Rating from account WHERE Rating =:filtre ];
        return acclist;
    }    

