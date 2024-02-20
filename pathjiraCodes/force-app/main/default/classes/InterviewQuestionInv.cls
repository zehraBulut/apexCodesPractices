
public class InterviewQuestionInv {

    @invocablemethod (Label='Get Interview Question')
    public static List<String> GetIQ(){
        
        HttpResponse response = SendInterviewQuestion.getIQ();
        
        InterviewQuestionResponse result = InterviewQuestionResponse.parse(response.getBody());
        
        List<String> IQDetails = new List<String>();
        
        String emailbody = '<p style="color:red"><b>'+result.QuizName+ '</b></p><p>'+result.Description+ '</p>';
        
        	IQDetails.add(emailbody);
        
        return IQDetails;
        
    }

}
