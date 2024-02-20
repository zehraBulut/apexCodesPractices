//Database Class


//Insert Method:

Account a = new Account(name = 'Acme1');
Database.insert(a,false);

Account ac1 = new Account(name = 'Acme1');
Account ac2 = new Account(name = 'Acme1');
List<Account> acList = new List<Account>();
acList.add(ac1);
acList.add(ac2);
Database.SaveResult[] results = Database.insert(acList,false);

System.debug(listSaveResult);

Database.insert(recordList, true);


/*Insert Records with Partial Success
Create a list of Contacts: */

List<Contact> conList = new List<Contact>();
Contact con1 = new Contact(FirstName='Joe',LastName='Smith',Department='Finance');
Contact con2 = new Contact(FirstName='Kathy',LastName='Smith',Department='Technology');
Contact con3 = new Contact(FirstName='Caroline',LastName='Roth',Department='Finance');
Contact con4 = new Contact();

conList.add(con1);
conList.add(con2);
conList.add(con3);
conList.add(con4);

Database.SaveResult[] srList = Database.insert(conList, false);

for (Database.SaveResult sr : srList) {
    if (sr.isSuccess()) {
        System.debug('Successfully inserted contact. Contact ID: ' + sr.getId());
    } else {
        for(Database.Error err : sr.getErrors()) {
            System.debug('The following error has occurred.');
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('Contact fields that affected this error: ' + err.getFields());
	 }
    }
}

//getSobjectType():

Account ac = new Account();

Database.insert(ac, False);

System.debug(ac.getSobjectType());

List<Contact> conList = new List<Contact>();
Contact con1 = new Contact(FirstName='Joe',LastName='Smith',Department='Finance');
Contact con2 = new Contact(FirstName='Kathy',LastName='Smith',Department='Technology');
Contact con3 = new Contact(FirstName='Caroline',LastName='Roth',Department='Finance');
Contact con4 = new Contact();

conList.add(con1);
conList.add(con2);
conList.add(con3);
conList.add(con4);

Database.SaveResult[] srList = Database.insert(conList, false);

for (Database.SaveResult sr : srList) {
    if (sr.isSuccess()) {
        System.debug('Successfully inserted contact. Contact ID: ' + sr.getId());
    } else {
        for(Database.Error err : sr.getErrors()) {
            System.debug('The following error has occurred.');
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('Contact fields that affected this error: ' + err.getFields());
	 }
    }
}