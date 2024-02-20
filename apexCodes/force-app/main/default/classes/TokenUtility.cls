public class TokenUtility {
    public static String getTokenByLabel(string label){
        TokenList__mdt   mytoken = TokenList__mdt.getInstance(label);
          return   mytoken.token__c;     
    }
}