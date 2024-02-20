public class PTSUsersInvocable {
    
    @InvocableMethod(Label='Get Users')
    public static List<String> updatePTSUserList(){
        
        //our PTSUsers class has return type that String
        //so we should assign the String variable
        String nameList=PTSUsers.getUserList();
        
        //invocable method always get List. This is rule
        //our class is string. However, invocable class must assign one upper version
        //so it must List of String
        return new List<String>{nameList};
    }

}