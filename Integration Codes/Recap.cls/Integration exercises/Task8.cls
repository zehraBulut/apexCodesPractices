/*TASK: rating i endpointin sonunda sadece deger olarak ekleyıp,  ilgili ratinge sahip accountlari donen kodu yaziniz
Yanı ratıngı hot olanları ıtıyorum mesela: */

@RestResource(UrlMapping='/account/*')
global class provider { 
    // rating i endpointin sonunda sadece deger olarak alip,  ilgili ratinge sahip accountlari donen kodu yaziniz
    // https://wisequarter-13c-dev-ed.develop.my.salesforce.com/services/apexrest/account/hot
   @HttpGet
    global static List<account> method04(){
     RestRequest request=restContext.request;
      String filtre = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        List< account>accList = [SELECT ID,name,Rating from account WHERE Rating =:filtre ];
        return acclist;
    }    


