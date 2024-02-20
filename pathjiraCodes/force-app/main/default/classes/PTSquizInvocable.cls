/*
 File Name    : PTSquizInvocable
 Summary      : Invoking 'PTSQuizList' with methodName 'UpdateCourse' and this method  will be used by flow
 Created date : 12-7-2023
 
Zehra Bulut - Story 14 - Class Created.

******************************************************************************/

public class PTSquizInvocable {
    
    @Invocablemethod(Label='PTS Quiz Invocable')     
    public static void UpdateCourse(){
                
         PTSQuizList.getCourses();
    }
}