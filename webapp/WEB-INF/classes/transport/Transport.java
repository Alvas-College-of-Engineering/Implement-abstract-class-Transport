package transport;

public abstract class Transport {
    protected String vehicleNumber;
    protected int capacity;

    /**
     * Parameterized constructor to initialize common transport attributes.
     *
     * @param vehicleNumber the registration/identification number of the vehicle
     * @param capacity      the maximum carrying capacity of the vehicle
     */
    public Transport(String vehicleNumber, int capacity) {
        this.vehicleNumber = vehicleNumber;
        this.capacity = capacity;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public abstract String getType();
    public abstract String getDetailsHTML();
    public abstract void displayDetails();
}
