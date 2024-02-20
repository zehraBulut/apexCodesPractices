public class MathPractice {
    public static void practiceFour(){
        Integer a=40;
        Integer b=60;
         Integer c=50;
        Integer sum=a+b+c;
        if(sum<=0){
           system.debug('error');
        }else if(sum>0 && sum<50){
           system.debug('go on');
        }else if(sum>50 && sum <200){
            system.debug('10');
        }else if(sum>200 && sum<500){
         system.debug('30');
        }else if(sum>=500){
            system.debug('50');
        }else{
          system.debug('lost');
        } 
        
        
    }
    
    
    
}