public class CustomerInvocable{

    @InvocableMethod(label='Get Customers')
    public static void CallAPI(){
        
        customerAPI.getCustomersByResponse();
    
    }
}