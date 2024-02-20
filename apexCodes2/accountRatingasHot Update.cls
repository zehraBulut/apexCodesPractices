//| Update Accounts | Rating as Hot
//1st Way:
public class UpdateAccounts{
        public static void UpdateAccountRating() {
      Account[] acList = [SELECT Id, Rating FROM Account WHERE Rating != 'Cold'];
      for (Account ac: acList ) {
          ac.Rating= 'Cold';
      }
      update acList;
    }

}
   //2nd Way
public class UpdateAccounts{
        public static void UpdateAccountRating() {
      Account[] acList = [SELECT Id, Rating FROM Account];
      for (Account ac: acList ) {
          if(ac.Rating != 'Cold'){
              ac.put('Rating','Cold');
          }
      }
      update acList;
    }

}
//Execute the Program:
UpdateAccounts.UpdateAccountRating()

