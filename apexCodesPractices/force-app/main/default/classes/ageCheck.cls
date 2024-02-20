public class ageCheck {
    public static void userAgeCheck(integer age) {
        if (age<0) {
          throw new myException('yas negatif olamaz');
        }
         system.debug('yas' + age);
         
    } 
}