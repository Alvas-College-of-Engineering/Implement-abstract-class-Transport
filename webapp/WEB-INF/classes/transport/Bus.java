package transport;

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
    public String getType() {
        return "Bus";
    }

    @Override
    public String getDetailsHTML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<tr>");
        sb.append("<td>").append(vehicleNumber).append("</td>");
        sb.append("<td><span class='badge badge-bus'>Bus</span></td>");
        sb.append("<td>").append(capacity).append(" passengers</td>");
        sb.append("<td>").append(route).append("</td>");
        sb.append("<td>").append(busType).append("</td>");
        sb.append("</tr>");
        return sb.toString();
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
