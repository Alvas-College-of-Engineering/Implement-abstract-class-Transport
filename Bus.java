public class Bus extends Transport {

    private String route;
    private String busType;

    /**
     * Parameterized constructor for Bus.
     *
     * @param vehicleNumber the registration number of the bus
     * @param capacity      the seating capacity of the bus
     * @param route         the route the bus operates on
     * @param busType       the type of bus (AC, Non-AC, Sleeper, etc.)
     */
    public Bus(String vehicleNumber, int capacity, String route, String busType) {
        super(vehicleNumber, capacity);
        this.route = route;
        this.busType = busType;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getBusType() {
        return busType;
    }

    public void setBusType(String busType) {
        this.busType = busType;
    }

    @Override
    public void displayDetails() {
        System.out.println("========== BUS DETAILS ==========");
        System.out.println("Vehicle Number : " + vehicleNumber);
        System.out.println("Capacity       : " + capacity + " passengers");
        System.out.println("Route          : " + route);
        System.out.println("Bus Type       : " + busType);
        System.out.println("=================================");
    }
}
