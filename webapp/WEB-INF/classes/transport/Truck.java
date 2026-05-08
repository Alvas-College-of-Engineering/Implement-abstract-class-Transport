package transport;

public class Truck extends Transport {

    private String cargoType;
    private double maxLoadTons;

    /**
     * Parameterized constructor for Truck.
     *
     * @param vehicleNumber the registration number of the truck
     * @param capacity      the capacity of the truck (e.g., number of pallets)
     * @param cargoType     the type of cargo the truck is designed to carry
     * @param maxLoadTons   the maximum load the truck can carry in tons
     */
    public Truck(String vehicleNumber, int capacity, String cargoType, double maxLoadTons) {
        super(vehicleNumber, capacity);
        this.cargoType = cargoType;
        this.maxLoadTons = maxLoadTons;
    }

    public String getCargoType() {
        return cargoType;
    }

    public void setCargoType(String cargoType) {
        this.cargoType = cargoType;
    }

    public double getMaxLoadTons() {
        return maxLoadTons;
    }

    public void setMaxLoadTons(double maxLoadTons) {
        this.maxLoadTons = maxLoadTons;
    }

    @Override
    public String getType() {
        return "Truck";
    }

    @Override
    public String getDetailsHTML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<tr>");
        sb.append("<td>").append(vehicleNumber).append("</td>");
        sb.append("<td><span class='badge badge-truck'>Truck</span></td>");
        sb.append("<td>").append(capacity).append(" pallets</td>");
        sb.append("<td>").append(cargoType).append("</td>");
        sb.append("<td>").append(maxLoadTons).append(" tons</td>");
        sb.append("</tr>");
        return sb.toString();
    }

    @Override
    public void displayDetails() {
        System.out.println("========= TRUCK DETAILS =========");
        System.out.println("Vehicle Number : " + vehicleNumber);
        System.out.println("Capacity       : " + capacity + " pallets");
        System.out.println("Cargo Type     : " + cargoType);
        System.out.println("Max Load       : " + maxLoadTons + " tons");
        System.out.println("=================================");
    }
}
