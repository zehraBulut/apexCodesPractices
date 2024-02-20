
public class HTTPUtility {
    
    public static HttpResponse getMethod(String EndPoint){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint(EndPoint);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);       
        return response;   
        
    }
    
    
    
    
    public static HttpResponse postMethod(String EndPoint, Object payload){
        
        Http http = new Http(); 
        HttpRequest request = new HttpRequest(); 
        request.setEndPoint(EndPoint);         
        request.setBody(JSON.serialize(payload));
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setMethod('POST');
        
        HttpResponse response = Http.send(request);
        return response;   
        
    }   
   
    
}