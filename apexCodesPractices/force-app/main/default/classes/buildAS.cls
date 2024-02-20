public class buildAS {
    public static void cnewCon(string firstName,string lastName,string name){
        
     contact con = new contact();
        
        if(string.isNotBlank(name)){
        List<string> namep = name.split(' ');
            
             firstName= namep[0];
             lastName= namep[1];
        }
            con.FirstName =firstName;
            con.LastName = lastName;
         
        
        insert con;
        
        }
        
  
}