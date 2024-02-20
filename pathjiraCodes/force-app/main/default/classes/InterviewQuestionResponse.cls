public class InterviewQuestionResponse {

    public String QuizName;
    public String Description;

    
    public static InterviewQuestionResponse parse(String json) {
    return (InterviewQuestionResponse) System.JSON.deserialize(json, InterviewQuestionResponse.class);
    }
}