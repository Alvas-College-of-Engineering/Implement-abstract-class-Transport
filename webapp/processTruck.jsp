<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="transport.*" %>
<%
    // Retrieve form data
    String vehicleNumber = request.getParameter("vehicleNumber");
    int capacity = Integer.parseInt(request.getParameter("capacity"));
    String cargoType = request.getParameter("cargoType");
    double maxLoadTons = Double.parseDouble(request.getParameter("maxLoadTons"));

    // Get or create FleetManager from session
    FleetManager fm = (FleetManager) session.getAttribute("fleetManager");
    if (fm == null) {
        fm = new FleetManager();
    }

    // Create a new Truck object (demonstrates creating a concrete subclass)
    Truck newTruck = new Truck(vehicleNumber, capacity, cargoType, maxLoadTons);

    // Add to the fleet (stored as Transport reference — polymorphism)
    fm.addTransport(newTruck);
    session.setAttribute("fleetManager", fm);

    // Set success message and forward to index
    request.setAttribute("successMsg", "Truck \"" + vehicleNumber + "\" added successfully to the fleet!");
%>
<jsp:forward page="index.jsp" />
