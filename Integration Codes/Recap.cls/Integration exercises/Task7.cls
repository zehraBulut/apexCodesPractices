//TASK:5 adet account donen provider class yaziniz
@RestResource(UrlMapping='/account/*')
global class provider {    
   @HttpGet
    global static List<account> method04(){
        List< account>accList=[SELECT ID,name from account LIMIT  5];
        return acclist;    
    }    

