public class Truck extends Vehicle {
public Integer loadCapacity;

    public override void displayDetails() {
        System.debug('Truck Details: ' + make + ' ' + model + ', Year: ' + year + ', Load Capacity: ' + loadCapacity + ' tons');
    }

    public override void calculateTotalPrice() {
        system.debug(price);
        // Custom logic for calculating total price of a truck
        // Example: price + additional charges for towing capabilities
    }
}