public class SampleData {
    
    public static Account acc;
    public static Contact conn;
    
    public static Account NewAccount(){
        
        Account ac = new Account();
        ac.Name=generateAccountName();
        ac.Rating=generateRating();
        ac.Active__c='Yes';
        
        insert ac;
        
        acc=ac;
        
        return ac;
    }
    
    public static void NewContact(){
        List<Contact> conList = new List<Contact>();
        
        List<String> conLevels = new List<String>{'Primary', 'Secondary','Tertiary'};
         
            if(acc.Rating =='Hot'){
                
                for(Integer i=0; i<3; i++){
                    Contact con = new Contact();
                    con.FirstName=generateFirstName();
                    con.LastName=generateLastName();
                    con.Level__c=conLevels.get(i);
                    con.AccountId = acc.Id;
                    conList.add(con);
                }
            }
        
        else if(acc.Rating =='Warm'){
                
                for(Integer i=0; i<2; i++){
                    Contact con = new Contact();
                    con.FirstName=generateFirstName();
                    con.LastName=generateLastName();
                    con.Level__c=conLevels.get(i);
                    con.AccountId = acc.Id;
                    conList.add(con);
                }
            }
        else {
            Contact con = new Contact();
                    con.FirstName=generateFirstName();
                    con.LastName=generateLastName();
                    con.Level__c=conLevels.get(0);
                    con.AccountId = acc.Id;
                    conList.add(con);
        }
        
        insert conList;
        
        conn = conList.get(0);

            
    }
    
    public static void NewOpp(){
        Opportunity opp = new Opportunity();
        opp.Name = acc.Name + ':' + conn.FirstName + ' ' + conn.LastName;
        opp.CloseDate= Date.today().addDays(5);   /// Date.today()+5
        opp.StageName=generateStageName();
        opp.AccountId = acc.Id;
        
        insert opp;
    }
    
    public static void NewCase(){
        Case cs = new Case();
        cs.Origin=generateOrigin();
        cs.Subject=generateSubject();
        cs.AccountId=acc.Id;
        cs.ContactId = conn.Id;
        
        insert cs;
    }
    
    public static String generateAccountName(){
        
        List<String> myList = new List<String>{'Salesforce', 'Microsoft', 'Apple', 'Amazon', 'AssisRx','Facebook', 'Google', 'Walmart','Meta' };
        
           Integer index = Math.mod(Math.round(Math.random() *100 ), myList.size());
        
        return myList.get(index);
    }
    
    public static String generateRating(){
        
        List<String> myList = new List<String>{'Hot', 'Warm', 'Cold'};
        
           Integer index = Math.mod(Math.round(Math.random() *100 ), myList.size());
        
        return myList.get(index);
    }
    
    public static String generateFirstName(){
        
        List<String> myList = new List<String>{'Emma', 'Olivia', 'Ava', 'Isabella', 'Sophia', 'Mia', 'Charlotte', 'Amelia', 'Evelyn', 'Abigail', 'Harper', 'Emily', 'Elizabeth', 'Avery', 'Sofia', 'Ella', 'Madison', 'Scarlett', 'Victoria', 'Chloe'};
        
           Integer index = Math.mod(Math.round(Math.random() *100 ), myList.size());
        
        return myList.get(index);
    }
    
    public static String generateLastName(){
        
        List<String> myList = new List<String>{'Smith', 'Johnson', 'Brown', 'Taylor', 'Miller', 'Anderson', 'Jackson', 'Davis', 'White', 'Harris', 'Clark', 'Allen', 'Young', 'Scott', 'Hall', 'King', 'Wright', 'Turner', 'Parker', 'Collins'};
        
           Integer index = Math.mod(Math.round(Math.random() *100 ), myList.size());
        
        return myList.get(index);
    }
    
    public static String generateStageName(){
        
        List<String> myList = new List<String>{'Prospecting', 'Qualification', 'Needs Analysis', 'Value Proposition', 'Id. Decision Makers', 'Perception Analysis', 'Proposal/Price Quote', 'Negotiation/Review', 'Closed Won', 'Closed Lost'};
            
            Integer index = Math.mod(Math.round(Math.random() * 100), myList.size());
        
        return myList.get(index);
    }
    
    public static String generateOrigin(){
        
        List<String> myList = new List<String>{'Web', 'Phone', 'Email'};
            
            Integer index = Math.mod(Math.round(Math.random() * 100), myList.size());
        
        return myList.get(index);
    }
    
     public static String generateSubject(){
        
        List<String> myList = new List<String>{'Account Access', 'Billing Inquiry', 'Technical Support', 'Product Feedback', 'Product Defect', 'Sales Inquiry', 'Training Request', 'General Feedback', 'Complaint', 'Other'};
            
            Integer index = Math.mod(Math.round(Math.random() * 100), myList.size());
        
        return myList.get(index);
    }
    
    @InvocableMethod (label='Create Sample Data')
    public static void run(List<List<Integer>> numList){
        
        Integer num = numList[0][0];
        
        for(Integer i=1; i<= num; i++){
            
            NewAccount();
        NewContact();
        NewCase();
        NewOpp();
            
        }
            
        
    }

}