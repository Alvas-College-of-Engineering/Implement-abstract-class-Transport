public class TransportManagementSystem {

    public static void main(String[] args) {

        System.out.println("********************************************");
        System.out.println("*    TRANSPORT MANAGEMENT SYSTEM           *");
        System.out.println("*        Student: Viraj Jain               *");
        System.out.println("*          USN: 4AL23CS184                 *");
        System.out.println("********************************************\n");

        // Bus objects
        Bus bus1 = new Bus("KA-01-AB-1234", 50, "Bangalore - Mysore", "AC");
        Bus bus2 = new Bus("MH-12-CD-5678", 40, "Mumbai - Pune", "Non-AC");

        // Truck objects
        Truck truck1 = new Truck("TN-07-EF-9012", 20, "Refrigerated", 15.5);
        Truck truck2 = new Truck("DL-03-GH-3456", 30, "Flatbed", 25.0);

        //Demonstrating Runtime Polymorphism
        // Using an array of Transport references to hold Bus and Truck objects
        Transport[] fleet = { bus1, truck1, bus2, truck2 };

        System.out.println("--- Fleet Details (via Runtime Polymorphism) ---\n");
        for (Transport transport : fleet) {
            transport.displayDetails();
            System.out.println();
        }

        System.out.println("********************************************");
        System.out.println("*         END OF SYSTEM REPORT             *");
        System.out.println("********************************************");
    }
}
