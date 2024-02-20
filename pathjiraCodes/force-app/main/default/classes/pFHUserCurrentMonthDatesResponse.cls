public class PFHUserCurrentMonthDatesResponse {

    public String UserId;
    public String Days;
    
    public static List<PFHUserCurrentMonthDatesResponse> parse(String json) {
        return (List<PFHUserCurrentMonthDatesResponse>) System.JSON.deserialize(json, List<PFHUserCurrentMonthDatesResponse>.class);
   
    }
}