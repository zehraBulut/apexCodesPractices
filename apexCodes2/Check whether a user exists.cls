//Check whether a user exists
public static string findUser(String username){
    List<User> userList = [SELECT id, Username FROM User];
        
        String message='';
        for(User u : userList){
            if(u.username==username){
               message='User Found';
               break;
            }
            else {
                message='User Not Found';
            }
        }
     return message;
}
