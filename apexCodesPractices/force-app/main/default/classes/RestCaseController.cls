@RestResource(urlMapping='/FieldCase/*')
global class RestCaseController {

    @HTTPGet
    global static  Integer numberOfRelatedCases(){
        string AccountName = RestContext.request.params.get('AccountName');
       
        return  12;
        
    }
    
    
}