<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="transport.*" %>
<%
    // Retrieve form data
    String vehicleNumber = request.getParameter("vehicleNumber");
    int capacity = Integer.parseInt(request.getParameter("capacity"));
    String route = request.getParameter("route");
    String busType = request.getParameter("busType");

    // Get or create FleetManager from session
    FleetManager fm = (FleetManager) session.getAttribute("fleetManager");
    if (fm == null) {
        fm = new FleetManager();
    }

    // Create a new Bus object (demonstrates creating a concrete subclass)
    Bus newBus = new Bus(vehicleNumber, capacity, route, busType);

    // Add to the fleet (stored as Transport reference — polymorphism)
    fm.addTransport(newBus);
    session.setAttribute("fleetManager", fm);

    // Set success message and forward to index
    request.setAttribute("successMsg", "Bus \"" + vehicleNumber + "\" added successfully to the fleet!");
%>
<jsp:forward page="index.jsp" />
