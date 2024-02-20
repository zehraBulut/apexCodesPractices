public class car extends Vehicle {
 public String bodyType= 'SEDAN';

    public override void displayDetails() {
        System.debug('Car Details: ' + make + ' ' + model + ', Year: ' + year + ', Body Type: ' + bodyType);
    }

    public override void calculateTotalPrice() {
        system.debug(price);
        // Custom logic for calculating total price of a car
        // Example: price + additional charges for features
    }
}