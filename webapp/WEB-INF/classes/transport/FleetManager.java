package transport;

import java.util.ArrayList;
import java.util.List;

public class FleetManager {

    private List<Transport> fleet;

    public FleetManager() {
        fleet = new ArrayList<>();
        fleet.add(new Bus("KA-01-AB-1234", 50, "Bangalore - Mysore", "AC"));
        fleet.add(new Bus("MH-12-CD-5678", 40, "Mumbai - Pune", "Non-AC"));
        fleet.add(new Truck("TN-07-EF-9012", 20, "Refrigerated", 15.5));
        fleet.add(new Truck("DL-03-GH-3456", 30, "Flatbed", 25.0));
    }

    public List<Transport> getFleet() {
        return fleet;
    }

    public void addTransport(Transport t) {
        fleet.add(t);
    }

    public int getBusCount() {
        int count = 0;
        for (Transport t : fleet) {
            if (t instanceof Bus) count++;
        }
        return count;
    }

    public int getTruckCount() {
        int count = 0;
        for (Transport t : fleet) {
            if (t instanceof Truck) count++;
        }
        return count;
    }

    public int getTotalCount() {
        return fleet.size();
    }
}
