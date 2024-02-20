public class ApexPrograms{
    //Find max element    
    public static Integer maxIntegerofList(List<Integer>intList){
        Integer maxInteger = intList.get(0);
        for(Integer i=1; i<intList.size();i++){
            if( intList.get(i)>maxInteger){
                maxInteger=intList.get(i);
            }
        }
        return maxInteger;    
    }  
}


@isTest
public class ApexProgramsTest {
   @isTest
    public static void testA(){
        Integer result = ApexPrograms.maxIntegerofList(new List<Integer>{18,25,12,30,90});
        system.assertEquals(90,result);
    }
}