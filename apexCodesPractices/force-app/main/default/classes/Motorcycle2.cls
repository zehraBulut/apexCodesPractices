public class Motorcycle2 extends Vehicle  {
  public String style='HARLY';

    public override void displayDetails() {
        System.debug('Motorcycle Details: ' + make + 'destina ' + model + ', Year: ' + year + ', Style: ' + style);
    }

    public override void calculateTotalPrice() {
        system.debug(price*3);
        // Custom logic for calculating total price of a motorcycle
        // Example: price + customization charges
    }
    
    
    
}