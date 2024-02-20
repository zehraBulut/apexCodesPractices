public class SendNewYearEmail implements schedulable {
    
    private final string recipentEmail = 'bulutaktar@gmail.com';
    private final string subject ='new year message';
    private final string body='happy new year 2023!';
    
    public void execute (schedulableContext sc){
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        
        message.setToAddresses(new string[] {recipentEmail});
        message.setSubject('subject');
        message.setPlainTextBody(body);
        messaging.sendEmail(new Messaging.singleEmailMessage[]{message});

    }
}