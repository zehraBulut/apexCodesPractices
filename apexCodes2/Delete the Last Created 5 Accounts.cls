//Delete the Last Created 5 Accounts

//Create a code which deletes the last inserted 5 Accounts

List<Account> acList =[SELECT Id FROM Account ORDER BY CreatedDate DESC LIMIT 5];
delete acList;


//  NOT: ORDER BY ASC USTTE YENILER ALTTA ESKILER—yenıden eskıye
      ORDER BY DESC ESKIDEN YENİYE
